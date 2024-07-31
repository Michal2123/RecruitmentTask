part of 'group_bloc.dart';

sealed class GroupEvent extends Equatable {}

final class GroupListGet extends GroupEvent {
  @override
  List<Object?> get props => [];
}

final class GroupSelect extends GroupEvent {
  GroupSelect({required this.group});
  final GroupModel group;
  @override
  List<Object?> get props => [group];
}

final class GroupSelectClear extends GroupEvent {
  @override
  List<Object?> get props => [];
}

final class GroupFormCreate extends GroupEvent {
  @override
  List<Object?> get props => [];
}

final class GroupMemberUpdate extends GroupEvent {
  GroupMemberUpdate(
      {required this.id, required this.firstName, required this.value});
  final String id;
  final String firstName;
  final bool value;
  @override
  List<Object?> get props => [];
}

final class GroupDelete extends GroupEvent {
  GroupDelete({required this.group});
  final GroupModel group;
  @override
  List<Object?> get props => [group];
}

final class GroupSave extends GroupEvent {
  @override
  List<Object?> get props => [];
}

final class GroupEditPersonDelete extends GroupEvent {
  GroupEditPersonDelete({required this.personId});
  final String personId;
  @override
  List<Object?> get props => [personId];
}
