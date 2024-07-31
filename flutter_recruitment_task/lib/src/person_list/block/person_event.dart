part of 'person_block.dart';

sealed class PersonEvent extends Equatable {}

final class PersonListGet extends PersonEvent {
  @override
  List<Object> get props => [];
}

final class PersonSelect extends PersonEvent {
  PersonSelect({required this.person});
  final PersonModel person;

  @override
  List<Object> get props => [person];
}

final class PersonSelectClear extends PersonEvent {
  @override
  List<Object> get props => [];
}

final class PersonSave extends PersonEvent {
  @override
  List<Object> get props => [];
}

final class PersonDelete extends PersonEvent {
  PersonDelete({required this.person});
  final PersonModel person;

  @override
  List<Object> get props => [person];
}

final class PersonGroupEdit extends PersonEvent {
  PersonGroupEdit({required this.groupId});
  final String? groupId;
  @override
  List<Object> get props => [];
}
