part of 'person_block.dart';

final class PersonState extends Equatable {
  const PersonState(
      {this.status = PersonStatus.initial,
      this.personList = const <PersonModel>[],
      this.person});
  final PersonStatus status;
  final List<PersonModel> personList;
  final PersonModel? person;

  PersonState copyWith(
      {PersonStatus Function()? status,
      List<PersonModel> Function()? personList}) {
    return PersonState(
        status: status != null ? status() : this.status,
        personList: personList != null ? personList() : this.personList);
  }

  @override
  String toString() {
    return 'PersonState {personList: $personList, personModel: $person}';
  }

  @override
  List<Object?> get props => [personList, person];
}
