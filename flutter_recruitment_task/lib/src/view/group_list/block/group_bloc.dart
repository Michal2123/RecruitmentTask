import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/helpers/form_data_mixin.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

part 'group_state.dart';
part 'group_event.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> with FormData {
  GroupBloc({required Repository repository})
      : _repository = repository,
        super(GroupState.initial()) {
    on<GroupListGet>(_onGroupListGet);
    on<GroupDelete>(_onGroupDelete);
    on<GroupSelect>(_onGroupSelect);
    on<GroupSelectClear>(_onGroupSelectClear);
    on<GroupFormCreate>(_onGroupFormCreat);
    on<GroupMemberUpdate>(_onGroupMemberUpdate);
    on<GroupSave>(_onGroupSave);
    on<GroupPersonEdit>(_onGroupPrsonEdit);
    on<GroupPersonDelete>(_onGroupEditPersonDelete);
  }

  final Repository _repository;

  ///Call [getGroupList] from [Repository] and update
  ///[status] and [groupList] in [GroupState].
  ///Get add groups.
  Future<void> _onGroupListGet(
      GroupListGet event, Emitter<GroupState> emit) async {
    emit(state.copyWith(status: GroupStatus.loading));
    try {
      var response = await _repository.getGroupList();
      _repository.groupList.addAll(response);
      emit(state.copyWith(
          status: GroupStatus.succes,
          groupList: List.from(_repository.groupList)));
      emit(state.copyWith(status: GroupStatus.initial));
    } catch (e) {
      emit(state.copyWith(status: GroupStatus.error));
    }
  }

  ///Call [deleteGroup] from [Repository] and update
  ///[groupList] in [GroupState].
  ///Delete [group] from list of groups.
  Future<void> _onGroupDelete(
      GroupDelete event, Emitter<GroupState> emit) async {
    await _repository.deleteGroup(event.group.id);
    emit(state.copyWith(
        groupList: List.from(_repository.groupList
          ..removeWhere((element) => element.id == event.group.id))));
  }

  ///Updates [group] and [status] in [GroupState].
  ///Save in [GroupState] state selected [group].
  _onGroupSelect(GroupSelect event, Emitter<GroupState> emit) {
    emit(state.copyWith(
      status: GroupStatus.initial,
      group: event.group,
    ));
  }

  ///Reset [isCheck] field of all [PersonModel] objects of [groupMembers] and clear [group] object.
  ///Update [groupMembers], [group] and [status] in [GroupState].
  _onGroupSelectClear(GroupSelectClear event, Emitter<GroupState> emit) {
    var groupMembers = _repository.personList
        .map(
          (e) => GroupMemberModel(
              id: e.id, firstName: e.firstName, isCheck: false),
        )
        .toList();
    emit(state.copyWith(
        groupMembers: groupMembers, group: null, status: GroupStatus.initial));
  }

  ///Get all members of selected group [groupMembers] and updates this list in [GroupState].
  Future<void> _onGroupFormCreat(
      GroupFormCreate event, Emitter<GroupState> emit) async {
    var groupMembers = _repository.personList.map(
      (e) {
        var isCheck =
            state.group?.groupMemberList.any((element) => element.id == e.id) ??
                false;
        return GroupMemberModel(
            id: e.id, firstName: e.firstName, isCheck: isCheck);
      },
    ).toList();
    emit(state.copyWith(groupMembers: groupMembers, group: state.group));
  }

  ///Select member from [groupMembers] and updates this member.
  ///Updates [groupMember] in [GroupState].
  ///Call when [isCheck] changes value.
  Future<void> _onGroupMemberUpdate(
      GroupMemberUpdate event, Emitter<GroupState> emit) async {
    var groupMembers = List<GroupMemberModel>.from(state.groupMembers);
    groupMembers[state.groupMembers.indexWhere(
      (element) => element.id == event.groupMember.id,
    )] = event.groupMember;

    emit(state.copyWith(groupMembers: groupMembers, group: state.group));
  }

  ///Save new or updates existing group in [groupList].
  ///Call [updateGroup] if group exists or call [insertNewGroup] if group is new.
  ///Updates [groupList], [group] and [state] in [GroupState].
  Future<void> _onGroupSave(GroupSave event, Emitter<GroupState> emit) async {
    emit(state.copyWith(status: GroupStatus.loading, group: state.group));
    try {
      var groupMembers = List<GroupMemberModel>.from(
          state.groupMembers.where((element) => element.isCheck));
      var group = parseToGroupModel(id: state.group?.id, members: groupMembers);
      if (state.group?.id != null) {
        await _repository.updateGroup(group);
        _repository.groupList
            .removeWhere((element) => element.id == state.group?.id);
      } else {
        await _repository.insertNewgroup(group);
      }
      emit(state.copyWith(
          groupList: List<GroupModel>.from(_repository.groupList..add(group)),
          group: group,
          status: GroupStatus.succes));
      clearFormData();
    } catch (e) {
      emit(state.copyWith(status: GroupStatus.error, group: state.group));
    }
  }

  ///Search member in all groups and removes.
  ///Call when person is delete from list of persons.
  ///Updates [groupList] in [GroupState].
  Future<void> _onGroupEditPersonDelete(
      GroupPersonDelete event, Emitter<GroupState> emit) async {
    for (var group in _repository.groupList) {
      group.groupMemberList
          .removeWhere((element) => element.id == event.personId);
      await _repository.updateGroup(group);
    }
    emit(state.copyWith(
        groupList: List<GroupModel>.from(_repository.groupList)));
  }

  ///Search member in all groups and updates his name.
  ///Call when peston data are updated.
  ///Call [updateGroup] from [Repository].
  ///Updates [groupList] in [GroupState].
  Future<void> _onGroupPrsonEdit(
      GroupPersonEdit event, Emitter<GroupState> emit) async {
    var person = event.person;
    if (person != null) {
      var groupList = _repository.groupList
          .where((group) =>
              group.groupMemberList.map((e) => e.id).contains(person.id))
          .toList();

      for (var group in groupList) {
        group.groupMemberList[group.groupMemberList
                .indexWhere((element) => element.id == person.id)] =
            GroupMemberModel(id: person.id, firstName: person.firstName);

        await _repository.updateGroup(group);
        emit(state.copyWith(groupList: _repository.groupList));
      }
    }
  }
}
