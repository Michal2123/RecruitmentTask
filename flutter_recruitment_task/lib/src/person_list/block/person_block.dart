import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

part 'person_state.dart';
part 'person_event.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc({required Repository repository})
      : _repository = repository,
        super(PersonState.initial()) {
    on<PersonListGet>(_onPersonListGet);
    on<PersonDelete>(_onPersonDelete);
    on<PersonSave>(_onPersonSave);
    on<PersonSelect>(_onPersonSelect);
    on<PersonSelectClear>(_onPersonSelectClear);
  }

  final Repository _repository;
  Map<String, String?> personFormData = {};

  Future<void> _onPersonListGet(
      PersonListGet event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: PersonStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(
        status: PersonStatus.succes,
        personList: List.from(_repository.mockList)));
  }

  Future<void> _onPersonDelete(
      PersonDelete event, Emitter<PersonState> emit) async {
    emit(state.copyWith(
        personList: List.from(_repository.mockList
          ..removeWhere(
            (element) => element.id == event.person.id,
          ))));
  }

  Future<void> _onPersonSave(
      PersonSave event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: PersonStatus.loading));
    var person = PersonModel(
        id: state.person?.id,
        firstName: personFormData[PersonFieldName.firstName.name] ?? '',
        lastName: personFormData[PersonFieldName.lastName.name] ?? '',
        birthDate: personFormData[PersonFieldName.birthDate.name] ?? '',
        zipCode: personFormData[PersonFieldName.zipCode.name] ?? '',
        city: 'Warsaw',
        street: 'Street',
        groups: const []);
    if (state.person?.id != null) {
      emit(state.copyWith(
          personList: List.from(_repository.mockList
            ..removeWhere(
              (element) => element.id == state.person?.id,
            ))));
    }
    emit(state.copyWith(
        personList: List.from(_repository.mockList..add(person)),
        person: person));
    emit(state.copyWith(status: PersonStatus.succes));
  }

  saveFormData(Map<String, String?> data) {
    personFormData.addAll(data);
  }

  Future<void> _onPersonSelect(
      PersonSelect event, Emitter<PersonState> emit) async {
    emit(state.copyWith(personId: event.person.id, person: event.person));
  }

  Future<void> _onPersonSelectClear(
      PersonSelectClear event, Emitter<PersonState> emit) async {
    emit(state.copyWith(personId: null, person: null));
  }
}
