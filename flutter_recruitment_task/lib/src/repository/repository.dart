import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/api/group_api.dart';
import 'package:flutter_recruitment_task/src/api/person_api.dart';
import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';

final class Repository extends Equatable {
  const Repository(
      {required PersonApi personApi,
      required GroupApi groupApi,
      this.personList = const <PersonModel>[],
      this.groupList = const <GroupModel>[]})
      : _personApi = personApi,
        _groupApi = groupApi;

  final PersonApi _personApi;
  final GroupApi _groupApi;

  final List<PersonModel> personList;
  final List<GroupModel> groupList;

  Repository copyWith(
      {List<PersonModel>? personList, List<GroupModel>? groupList}) {
    return Repository(
        personApi: _personApi,
        groupApi: _groupApi,
        personList: personList ?? this.personList,
        groupList: groupList ?? this.groupList);
  }

  @override
  List<Object?> get props => [personList, groupList];

  Future<void> getPersonList() async {
    var response = await _personApi.get();
    personList.addAll(response.map((e) => PersonModel.fromJson(e)).toList());
  }

  Future<void> getGroupList() async {
    var response = await _groupApi.get();
    groupList.addAll(response.map((e) => GroupModel.fromJson(e)).toList());
  }

  Future<void> insertNewPerson(PersonModel person) async {
    var personMap = person.toMap();
    _personApi.insert(personMap);
  }

  Future<void> insertNewgroup(GroupModel group) async {
    var groupMap = group.toMap();
    _groupApi.insert(groupMap);
  }

  Future<void> updatePerson(PersonModel person) async {
    var personMap = person.toMap();
    _personApi.update(personMap, person.id);
  }

  Future<void> updateGroup(GroupModel group) async {
    var groupMap = group.toMap();
    _groupApi.update(groupMap, group.id);
  }

  Future<void> deletePerson(String personId) async {
    _personApi.delete(personId);
  }

  Future<void> deleteGroup(String groupId) async {
    _groupApi.delete(groupId);
  }
}
//  List<PersonModel> mockList = [
//     PersonModel(
//         id: '1',
//         firstName: 'person1',
//         lastName: 'aerson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 1',
//         zipCode: '00-000',
//         personGroupList: [
//           PersonGroupModel(id: '1', groupName: 'group1'),
//           PersonGroupModel(id: '2', groupName: 'group2'),
//           PersonGroupModel(id: '3', groupName: 'group3')
//         ]),
//     PersonModel(
//         id: '2',
//         firstName: 'person2',
//         lastName: 'berson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 2',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '3',
//         firstName: 'person3',
//         lastName: 'cerson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 3',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '4',
//         firstName: 'person4',
//         lastName: 'derson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 4',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '5',
//         firstName: 'person5',
//         lastName: 'eerson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 2',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '6',
//         firstName: 'person6',
//         lastName: 'ferson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 3',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '7',
//         firstName: 'person7',
//         lastName: 'gerson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 4',
//         zipCode: '00-000',
//         personGroupList: []),
//     PersonModel(
//         id: '8',
//         firstName: 'person8',
//         lastName: 'herson',
//         birthDate: '01/10/2001',
//         city: 'Warsaw',
//         street: 'street 2',
//         zipCode: '00-000',
//         personGroupList: []),
//   ];

//   List<GroupModel> groupMockList = <GroupModel>[
//     GroupModel(
//         id: '1',
//         groupName: 'Group1',
//         groupMemberList: <GroupMemberModel>[
//           GroupMemberModel(id: '1', firstName: 'person1'),
//           GroupMemberModel(id: '2', firstName: 'person2')
//         ]),
//     GroupModel(
//         id: '2',
//         groupName: 'Group2',
//         groupMemberList: <GroupMemberModel>[
//           GroupMemberModel(id: '3', firstName: 'person3'),
//           GroupMemberModel(id: '4', firstName: 'person4')
//         ]),
//     GroupModel(
//         id: '3',
//         groupName: 'Group3',
//         groupMemberList: <GroupMemberModel>[
//           GroupMemberModel(id: '1', firstName: 'person1'),
//           GroupMemberModel(id: '3', firstName: 'person3')
//         ]),
//   ];