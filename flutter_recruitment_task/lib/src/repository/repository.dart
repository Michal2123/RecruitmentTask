import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/api/group_api.dart';
import 'package:flutter_recruitment_task/src/api/person_api.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';

final class Repository extends Equatable {
  Repository({required PersonApi personApi, required GroupApi groupApi})
      : _groupApi = groupApi,
        _personApi = personApi;

  final PersonApi _personApi;
  final GroupApi _groupApi;
  final List<PersonModel> personList = <PersonModel>[];

  final List<GroupModel> groupList = <GroupModel>[];

  @override
  List<Object> get props => [personList, groupList, personList, groupList];

  ///Call [personApi.get] method, convert anto return respons as [PersonModel] object.
  Future<List<PersonModel>> getPersonList() async {
    var response = await _personApi.get();
    return response.map((e) => PersonModel.fromJson(e)).toList();
  }

  ///Call [groupApi.get] method, convert anto return respons as [GroupModel] object.
  Future<List<GroupModel>> getGroupList() async {
    var response = await _groupApi.get();
    return response.map((e) => GroupModel.fromJson(e)).toList();
  }

  ///Take parameter [person] and convert it do map, than call [personApi.insert] method
  /// and pass maped [person] as parameter.
  Future<void> insertNewPerson(PersonModel person) async {
    var personMap = person.toMap();
    _personApi.insert(personMap);
  }

  ///Take parameter [group] and convert it do map, than call [groupApi.insert] method
  /// and pass maped [group] as parameter.
  Future<void> insertNewgroup(GroupModel group) async {
    var groupMap = group.toMap();
    _groupApi.insert(groupMap);
  }

  ///Take parameter [person] and convert it do map, than call [personApi.update] method
  /// and pass maped [person] as parameter.
  Future<void> updatePerson(PersonModel person) async {
    var personMap = person.toMap();
    _personApi.update(personMap, person.id);
  }

  ///Take parameter [group] and convert it do map, than call [groupApi.update] method
  /// and pass maped [group] as parameter.
  Future<void> updateGroup(GroupModel group) async {
    var groupMap = group.toMap();
    _groupApi.update(groupMap, group.id);
  }

  ///Takes [personId], call [personApi.delete] method and pass [personId] as parameter.
  Future<void> deletePerson(String personId) async {
    _personApi.delete(personId);
  }

  ///Takes [groupId], call [groupApi.delete] method and pass [groupId] as parameter.
  Future<void> deleteGroup(String groupId) async {
    _groupApi.delete(groupId);
  }
}
