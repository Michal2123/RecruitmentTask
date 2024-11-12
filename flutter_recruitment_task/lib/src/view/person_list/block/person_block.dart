import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/helpers/form_data_mixin.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
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
    on<PersonGroupDelete>(_onPersonGroupDelete);
  }

  final Repository _repository;

  ///Call [getPersonList] from [Repository], update [status] and [personList]
  ///of [PersonState].
  ///Get all person list.
  Future<void> _onPersonListGet(
      PersonListGet event, Emitter<PersonState> emit) async {
    emit(state.copyWith(status: PersonStatus.loading));
    try {
      var response = await _repository.getPersonList();
      _repository.personList.addAll(response);
      emit(state.copyWith(
          status: PersonStatus.succes,
          personList: List.from(_repository.personList)));
    } catch (e) {
      emit(state.copyWith(status: PersonStatus.error));
    }
  }

  ///Call [deletePerson] from [Repository] and updates [personList] of [PersonState].
  ///Deletes person from [personList].
  Future<void> _onPersonDelete(
      PersonDelete event, Emitter<PersonState> emit) async {
    await _repository.deletePerson(event.person.id);
    _repository.personList.removeWhere(
      (element) => element.id == event.person.id,
    );
    emit(state.copyWith(personList: List.from(_repository.personList)));
  }

  ///Saves or updates person object.
  ///Call [updatePerson] if person object exists or [insertPerson] from [Repository].
  ///Updates [personList], [person] and [status] of [PersonState].
  Future<void> _onPersonSave(
      PersonSave event, Emitter<PersonState> emit) async {
    emit(state.copyWith(person: state.person, status: PersonStatus.loading));
    var personId = state.person?.id;
    var person =
        parseToPersonModel(id: personId, groups: state.person?.personGroupList);
    if (personId != null) {
      await _repository.updatePerson(person);
      _repository.personList.removeWhere(
        (element) => element.id == personId,
      );
      emit(state.copyWith(personList: List.from(_repository.personList)));
    } else {
      await _repository.insertNewPerson(person);
    }
    _repository.personList.add(person);
    emit(state.copyWith(
        personList: List<PersonModel>.from(_repository.personList),
        person: person,
        status: PersonStatus.succes));
    clearFormData();
  }

  ///Updates [person] and [status] of [PersonState].
  ///Save selected person object.
  Future<void> _onPersonSelect(
      PersonSelect event, Emitter<PersonState> emit) async {
    emit(state.copyWith(person: event.person, status: PersonStatus.initial));
  }

  ///Function updates [person] and [status] of [PersonState].
  ///Clear selected person object.
  Future<void> _onPersonSelectClear(
      PersonSelectClear event, Emitter<PersonState> emit) async {
    emit(state.copyWith(person: null, status: PersonStatus.initial));
  }

  ///Updates [personList] of [PersonState].
  ///Calls [findAndAddGroupItem], [findAndRemoveGroupItem], [findAndUpdateGroupName]
  ///end updates information about group of which person is a member.
  Future<void> _onPersonGroupEdit(
      PersonGroupEdit event, Emitter<PersonState> emit) async {
    var group = currentGroup(event.group?.id);
    await findAndAddGroupItem(group: group);
    await findAndRemoveGroupItem(group: group);
    await findAndUpdateGroupName(group: group);

    emit(state.copyWith(personList: _repository.personList));
  }

  ///Updates [personList] of [PersonState].
  ///Deletes info about group from [peronGroupList] and call [removePersonGroupItem].
  Future<void> _onPersonGroupDelete(
      PersonGroupDelete event, Emitter<PersonState> emit) async {
    var personList = _repository.personList.where((person) =>
        person.personGroupList.map((e) => e.id).contains(event.groupId));
    for (var person in personList) {
      await removePersonGroupItem(person: person, groupId: event.groupId);
    }
    emit(state.copyWith(personList: _repository.personList));
  }

  ///Finds all persons that are no longer part of selected group.
  ///Call [removePersonGroupItem].
  Future<void> findAndRemoveGroupItem({required GroupModel group}) async {
    var personListRemove = _repository.personList
        .where((person) =>
            person.personGroupList
                .map(
                  (e) => e.id,
                )
                .contains(group.id) &&
            !group.groupMemberList.map((e) => e.id).contains(person.id))
        .toList();

    for (var person in personListRemove) {
      await removePersonGroupItem(person: person, groupId: group.id);
    }
  }

  ///Removes info from [personGroupList] about group that person is no part of.
  ///Call [overridePersonItem] .
  Future<void> removePersonGroupItem(
      {required PersonModel person, required String groupId}) async {
    var personGroupList = List<PersonGroupModel>.from(person.personGroupList)
      ..removeWhere((element) => element.id == groupId);
    var newPerson = person.copyWith(personGroupList: personGroupList);
    await overridePersonItem(newPerson);
  }

  ///Find all persons that have no info about group they're part of.
  ///Call [addPersonGroupItem].
  Future<void> findAndAddGroupItem({required GroupModel group}) async {
    var personListAdd = _repository.personList
        .where(
          (person) =>
              group.groupMemberList
                  .map(
                    (e) => e.id,
                  )
                  .contains(person.id) &&
              !person.personGroupList.map((e) => e.id).contains(group.id),
        )
        .toList();

    for (var person in personListAdd) {
      await addPersonGroupItem(person: person, group: group);
    }
  }

  ///Add info about group that person is part of to [personGroupList].
  ///Call [overridePersonItem].
  Future<void> addPersonGroupItem(
      {required PersonModel person, required GroupModel group}) async {
    var personGroupList = List<PersonGroupModel>.from(person.personGroupList)
      ..add(PersonGroupModel(id: group.id, groupName: group.groupName));

    var newPerson = person.copyWith(personGroupList: personGroupList);
    await overridePersonItem(newPerson);
  }

  ///Finds persons that are part of group where [groupName] changed.
  ///Call [updatePersonGroupName].
  Future<void> findAndUpdateGroupName({required GroupModel group}) async {
    var personListUpdate = _repository.personList
        .where(
          (person) => person.personGroupList.any((element) =>
              element.id == group.id && element.groupName != group.groupName),
        )
        .toList();
    for (var person in personListUpdate) {
      await updatePersonGroupName(person: person, group: group);
    }
  }

  ///Update [groupName] of group where person are part of.
  ///Call [overridePersonItem].
  Future<void> updatePersonGroupName(
      {required PersonModel person, required GroupModel group}) async {
    var tempList = List<PersonGroupModel>.from(person.personGroupList);
    tempList[person.personGroupList
            .indexWhere((element) => element.id == group.id)] =
        PersonGroupModel(id: group.id, groupName: group.groupName);
    var newPerson = person.copyWith(personGroupList: tempList);
    await overridePersonItem(newPerson);
  }

  ///Updates person object in [personList] and call [updatePerson] from [Repository].
  ///
  Future<void> overridePersonItem(PersonModel person) async {
    await _repository.updatePerson(person);
    _repository.personList[_repository.personList
        .indexWhere((element) => element.id == person.id)] = person;
  }

  ///Select group from [groupList] if [group.id] equls [id].
  GroupModel currentGroup(String? id) {
    return _repository.groupList.firstWhere((element) => element.id == id);
  }

  ///Check if TextFormFiel inputFormatter is [birthDate] inputFormatter
  ///if yes return [birthDateCheck] and check controller value.
  String textFormFielCheck(String dateText, InputFormatters inputFormatter) {
    switch (inputFormatter) {
      case InputFormatters.birthDate:
        return birthDateCheck(dateText);
      default:
        return dateText;
    }
  }

  ///Check if value from birthDateFormfield is correct.
  ///Parse value to [DateTime] and check if date is after date now.
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
