import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/person_list/model/person_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

part 'person_state.dart';
part 'person_event.dart';

List<PersonModel> mockList = [
  PersonModel(
      firstName: 'person1',
      lastName: 'aerson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 1',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person2',
      lastName: 'berson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 2',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person3',
      lastName: 'cerson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 3',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person4',
      lastName: 'derson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 4',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person5',
      lastName: 'eerson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 2',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person6',
      lastName: 'ferson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 3',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person7',
      lastName: 'gerson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 4',
      zipCode: '00-000',
      groups: const []),
  PersonModel(
      firstName: 'person8',
      lastName: 'herson',
      birthDate: '01/10/2001',
      city: 'Warsaw',
      street: 'street 2',
      zipCode: '00-000',
      groups: const []),
];

class PersonBlock extends Bloc<PersonEvent, PersonState> {
  PersonBlock() : super(const PersonState()) {
    on<PersonListGet>(_onPersonListGet);
  }

  Future<void> _onPersonListGet(
      PersonListGet event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: () => PersonStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        status: () => PersonStatus.succes, personList: () => mockList));
  }
}
