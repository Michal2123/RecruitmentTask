import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/helpers/form_data_mixin.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/src/repository/repository.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

part 'person_state.dart';
part 'person_event.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> with FormData {
  PersonBloc({required Repository repository})
      : _repository = repository,
        super(PersonState.initial()) {
    on<PersonListGet>(_onPersonListGet);
    on<PersonDelete>(_onPersonDelete);
    on<PersonSave>(_onPersonSave);
    on<PersonSelect>(_onPersonSelect);
    on<PersonSelectClear>(_onPersonSelectClear);
    on<PersonGroupEdit>(_onPersonGroupEdit);
  }

  final Repository _repository;

  Future<void> _onPersonListGet(
      PersonListGet event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: PersonStatus.loading));

    await _repository.getPersonList();

    emit(state.copyWith(
        status: PersonStatus.succes,
        personList: List.from(_repository.personList)));
  }

  Future<void> _onPersonDelete(
      PersonDelete event, Emitter<PersonState> emit) async {
    await _repository.deletePerson(event.person.id);
    var personList = _repository.personList
      ..removeWhere(
        (element) => element.id == event.person.id,
      );
    _repository.copyWith(personList: personList);
    emit(state.copyWith(personList: List.from(_repository.personList)));
  }

  Future<void> _onPersonSave(
      PersonSave event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: PersonStatus.loading));
    var personId = state.person?.id;
    var person = PersonModel(
        id: state.person?.id,
        firstName: formData[PersonFieldName.firstName.name] ?? '',
        lastName: formData[PersonFieldName.lastName.name] ?? '',
        birthDate: formData[PersonFieldName.birthDate.name] ?? '',
        zipCode: formData[PersonFieldName.zipCode.name] ?? '',
        city: 'Warsaw',
        street: 'Street',
        personGroupList: const []);
    if (personId != null) {
      await _repository.updatePerson(person);
      var personList = _repository.personList
        ..removeWhere(
          (element) => element.id == personId,
        );
      _repository.copyWith(personList: personList);
      emit(state.copyWith(personList: List.from(_repository.personList)));
    } else {
      await _repository.insertNewPerson(person);
    }
    var personList = _repository.personList..add(person);
    _repository.copyWith(personList: personList);
    emit(state.copyWith(
        personList: List<PersonModel>.from(_repository.personList),
        person: person,
        status: PersonStatus.succes));
    clearFormData();
  }

  Future<void> _onPersonSelect(
      PersonSelect event, Emitter<PersonState> emit) async {
    emit(state.copyWith(person: event.person));
  }

  Future<void> _onPersonSelectClear(
      PersonSelectClear event, Emitter<PersonState> emit) async {
    emit(state.copyWith(person: null));
  }

  Future<void> _onPersonGroupEdit(
      PersonGroupEdit event, Emitter<PersonState> emit) async {
    for (var person in _repository.personList) {
      if (_repository.groupList.isNotEmpty) {
        for (var group in _repository.groupList) {
          var groupIds = _repository.groupList.map(
            (e) => e.id,
          );

          var groupMemberIds = group.groupMemberList.map((e) => e.id);

          var personGroupIds = person.personGroupList.map((e) => e.id);

          var unmatchGroupId =
              personGroupIds.toSet().difference(groupIds.toSet()).toList();

          var isGroupInPersonGroup = personGroupIds.contains(group.id);

          var isPersonInGroup = groupMemberIds.contains(person.id);

          if (unmatchGroupId.isNotEmpty) {
            removePersonGroupItem(person, unmatchGroupId.first);
          }
          if (isGroupInPersonGroup && !isPersonInGroup) {
            removePersonGroupItem(person, group.id);
          } else if (!isGroupInPersonGroup && isPersonInGroup) {
            addPersonGroupItem(person,
                PersonGroupModel(id: group.id, groupName: group.groupName));
          }
        }
      } else {
        overridePersonItem(
            person.copyWith(personGroupList: <PersonGroupModel>[]));
      }
    }

    emit(state.copyWith(
        personList: List<PersonModel>.from(_repository.personList)));
  }

  removePersonGroupItem(PersonModel person, String groupId) {
    var newPerson = person.copyWith(
        personGroupList: List<PersonGroupModel>.from(person.personGroupList)
          ..removeWhere((element) => element.id == groupId));
    overridePersonItem(newPerson);
  }

  addPersonGroupItem(PersonModel person, PersonGroupModel item) {
    var newPerson = person.copyWith(
        personGroupList: List<PersonGroupModel>.from(person.personGroupList)
          ..add(item));
    overridePersonItem(newPerson);
  }

  Future<void> overridePersonItem(PersonModel person) async {
    await _repository.updatePerson(person);
    var personList = _repository.personList;
    personList[personList.indexWhere((element) => element.id == person.id)] =
        person;
    _repository.copyWith(personList: personList);
  }

  String textFormFielCheck(String dateText, InputFormatters inputFormatter) {
    switch (inputFormatter) {
      case InputFormatters.birthDate:
        return birthDateCheck(dateText);
      default:
        return dateText;
    }
  }

  String birthDateCheck(String dateText) {
    try {
      var controllerDate = dateText.split('/');

      var date = DateTime.utc(int.parse(controllerDate[2]),
          int.parse(controllerDate[1]), int.parse(controllerDate[0]));
      if (date.isAfter(DateTime.now())) {
        date = DateTime.now();
      }
      return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (e) {
      return '';
    }
  }
}
