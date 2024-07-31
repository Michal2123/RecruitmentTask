import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/helpers/form_data_mixin.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
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
    on<GroupEditPersonDelete>(_onGroupEditPersonDelete);
  }

  final Repository _repository;

  Future<void> _onGroupListGet(
      GroupListGet event, Emitter<GroupState> emit) async {
    emit(state.copyWith(status: GroupStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        status: GroupStatus.succes,
        groupList: List.from(_repository.groupList)));
  }

  Future<void> _onGroupDelete(
      GroupDelete event, Emitter<GroupState> emit) async {
    emit(state.copyWith(
        groupList: List.from(_repository.groupList
          ..removeWhere((element) => element.id == event.group.id))));
  }

  Future<void> _onGroupSelect(
      GroupSelect event, Emitter<GroupState> emit) async {
    emit(state.copyWith(
      group: event.group,
    ));
  }

  Future<void> _onGroupSelectClear(
      GroupSelectClear event, Emitter<GroupState> emit) async {
    var groupMembers = _repository.personList
        .map(
          (e) => GroupMemberModel(
              id: e.id, firstName: e.firstName, isCheck: false),
        )
        .toList();
    emit(state.copyWith(groupMembers: groupMembers, group: null));
  }

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

  Future<void> _onGroupMemberUpdate(
      GroupMemberUpdate event, Emitter<GroupState> emit) async {
    var groupMembers = List<GroupMemberModel>.from(state.groupMembers);
    groupMembers[state.groupMembers.indexWhere(
      (element) => element.id == event.id,
    )] = GroupMemberModel(
        id: event.id, firstName: event.firstName, isCheck: event.value);

    emit(state.copyWith(groupMembers: groupMembers, group: state.group));
  }

  Future<void> _onGroupSave(GroupSave event, Emitter<GroupState> emit) async {
    emit(state.copyWith(status: GroupStatus.loading, group: state.group));

    var groupMembers = List<GroupMemberModel>.from(
        state.groupMembers.where((element) => element.isCheck));
    var group = GroupModel(
        id: state.group?.id,
        groupName: formData[GroupFieldName.groupName.name] ?? '',
        groupMemberList: groupMembers);
    if (state.group?.id != null) {
      emit(state.copyWith(
          groupList: List<GroupModel>.from(_repository.groupList
            ..removeWhere((element) => element.id == state.group?.id))));
    }
    emit(state.copyWith(
        groupList: List<GroupModel>.from(_repository.groupList..add(group)),
        group: group,
        status: GroupStatus.succes));
    clearFormData();
  }

  Future<void> _onGroupEditPersonDelete(
      GroupEditPersonDelete event, Emitter<GroupState> emit) async {
    for (var group in _repository.groupList) {
      group.groupMemberList
          .removeWhere((element) => element.id == event.personId);
    }
    emit(state.copyWith(
        groupList: List<GroupModel>.from(_repository.groupList)));
  }
}
