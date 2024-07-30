part of 'person_block.dart';

final class PersonState extends Equatable {
  const PersonState(
      {required this.status,
      required this.personList,
      required this.person,
      required this.personId});
  final PersonStatus status;
  final List<PersonModel> personList;
  final PersonModel? person;
  final String? personId;

  static PersonState initial() => const PersonState(
      status: PersonStatus.initial,
      personList: <PersonModel>[],
      person: null,
      personId: null);

  PersonState copyWith(
      {PersonStatus? status,
      List<PersonModel>? personList,
      PersonModel? person,
      String? personId}) {
    return PersonState(
        status: status ?? this.status,
        personList: personList ?? this.personList,
        person: person,
        personId: personId);
  }

  @override
  String toString() {
    return 'PersonState {personList: $personList, personModel: $person, personId: $personId}';
  }

  @override
  List<Object?> get props => [status, personList, person, personId];
}
