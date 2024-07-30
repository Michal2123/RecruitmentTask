import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

part 'group_state.dart';
part 'group_event.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc({required Repository repository})
      : _repository = repository,
        super(GroupState.initial()) {
    on<GroupListGet>(_onGroupListGet);
    on<GroupDelete>(_onGroupDelete);
    on<GroupSelect>(_onGroupSelect);
    on<GroupSelectClear>(_onGroupSelectClear);
    on<GroupFormCreate>(_onGroupFormCreat);
    on<GroupMemberUpdate>(_onGroupMemberUpdate);
  }

  final Repository _repository;

  Future<void> _onGroupListGet(
      GroupListGet event, Emitter<GroupState> emit) async {
    emit(state.copyWith(status: GroupStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        status: GroupStatus.succes,
        groupList: List.from(_repository.groupMockList)));
  }

  Future<void> _onGroupDelete(
      GroupDelete event, Emitter<GroupState> emit) async {
    emit(state.copyWith(
        groupList: List.from(_repository.groupMockList
          ..removeWhere((element) => element.id == event.group.id))));
  }

  Future<void> _onGroupSelect(
      GroupSelect event, Emitter<GroupState> emit) async {
    emit(state.copyWith(
      group: event.group,
      groupId: event.group.id,
    ));
  }

  Future<void> _onGroupSelectClear(
      GroupSelectClear event, Emitter<GroupState> emit) async {
    emit(state.copyWith(group: null, groupId: null));
  }

  Future<void> _onGroupFormCreat(
      GroupFormCreate event, Emitter<GroupState> emit) async {
    emit(state.copyWith(groupMembers: [], status: GroupStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    var groupMembers = _repository.mockList.map(
      (e) {
        var isCheck = state.group?.groupMemberList
                ?.any((element) => element.id == e.id) ??
            false;
        return GroupMemberModel(
            id: e.id, firstName: e.firstName, isCheck: isCheck);
      },
    ).toList();
    emit(
        state.copyWith(groupMembers: groupMembers, status: GroupStatus.succes));
  }

  Future<void> _onGroupMemberUpdate(
      GroupMemberUpdate event, Emitter<GroupState> emit) async {
    var groupMembers = List<GroupMemberModel>.from(state.groupMembers);
    groupMembers[state.groupMembers.indexWhere(
      (element) => element.id == event.id,
    )] = GroupMemberModel(
        id: event.id, firstName: event.firstName, isCheck: event.value);
    emit(state.copyWith(
      groupMembers: [],
    ));
    emit(state.copyWith(
      groupMembers: groupMembers,
    ));
  }

  Future<void> _onGroupSave(GroupSave event, Emitter<GroupState> emit) async {}
}
