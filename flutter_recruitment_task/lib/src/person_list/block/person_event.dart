part of 'person_block.dart';

sealed class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

final class PersonListGet extends PersonEvent {
  const PersonListGet();

  @override
  List<Object> get props => [];
}

final class PersonCreate extends PersonEvent {
  const PersonCreate({required this.person});
  final PersonModel person;

  @override
  List<Object> get props => [person];
}

final class PersonEdit extends PersonEvent {
  const PersonEdit({required this.person});
  final PersonModel person;

  @override
  List<Object> get props => [person];
}

final class PersonDelete extends PersonEvent {
  const PersonDelete({required this.person});
  final PersonModel person;

  @override
  List<Object> get props => [person];
}
