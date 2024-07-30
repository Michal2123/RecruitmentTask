import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';

class Repository {
  List<PersonModel> mockList = [
    PersonModel(
        id: '1',
        firstName: 'person1',
        lastName: 'aerson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 1',
        zipCode: '00-000',
        groups: const ['group1', 'group2', 'group3']),
    PersonModel(
        id: '2',
        firstName: 'person2',
        lastName: 'berson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 2',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '3',
        firstName: 'person3',
        lastName: 'cerson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 3',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '4',
        firstName: 'person4',
        lastName: 'derson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 4',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '5',
        firstName: 'person5',
        lastName: 'eerson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 2',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '6',
        firstName: 'person6',
        lastName: 'ferson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 3',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '7',
        firstName: 'person7',
        lastName: 'gerson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 4',
        zipCode: '00-000',
        groups: const []),
    PersonModel(
        id: '8',
        firstName: 'person8',
        lastName: 'herson',
        birthDate: '01/10/2001',
        city: 'Warsaw',
        street: 'street 2',
        zipCode: '00-000',
        groups: const []),
  ];

  List<GroupModel> groupMockList = <GroupModel>[
    GroupModel(groupName: 'Group1', groupMemberList: const <GroupMemberModel>[
      GroupMemberModel(id: '1', firstName: 'person1'),
      GroupMemberModel(id: '2', firstName: 'person2')
    ]),
    GroupModel(groupName: 'Group2', groupMemberList: const <GroupMemberModel>[
      GroupMemberModel(id: '3', firstName: 'person3'),
      GroupMemberModel(id: '4', firstName: 'person4')
    ]),
    GroupModel(groupName: 'Group3', groupMemberList: const <GroupMemberModel>[
      GroupMemberModel(id: '1', firstName: 'person1'),
      GroupMemberModel(id: '3', firstName: 'person3')
    ]),
  ];
}
