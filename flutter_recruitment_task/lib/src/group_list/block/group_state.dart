part of 'group_bloc.dart';

final class GroupState extends Equatable {
  const GroupState({
    required this.status,
    required this.groupList,
    required this.groupMembers,
    required this.group,
  });
  final GroupStatus status;
  final List<GroupModel> groupList;
  final List<GroupMemberModel> groupMembers;
  final GroupModel? group;

  static GroupState initial() => const GroupState(
      status: GroupStatus.initial,
      groupList: <GroupModel>[],
      groupMembers: <GroupMemberModel>[],
      group: null);

  GroupState copyWith(
      {GroupStatus? status,
      List<GroupModel>? groupList,
      List<GroupMemberModel>? groupMembers,
      GroupModel? group}) {
    return GroupState(
        status: status ?? this.status,
        groupList: groupList ?? this.groupList,
        groupMembers: groupMembers ?? this.groupMembers,
        group: group);
  }

  @override
  String toString() {
    return 'GroupState {groupList: $groupList, groupModel: $group}';
  }

  @override
  List<Object?> get props => [status, groupList, groupMembers, group];
}
