// import 'package:flutter_recruitment_task/src/person_list/block/person_block.dart';
// import 'package:flutter_recruitment_task/src/repository/repository.dart';
// import 'package:test/test.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_recruitment_task/src/model/person_model.dart';

// void main() {
//   List<PersonModel> mockList = [
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
//   ];

//   group(PersonBloc, () {
//     late PersonBloc personBloc;
//     late Repository repository;
//     setUp(() {
//       repository = Repository();
//       personBloc = PersonBloc(repository: repository);
//     });

//     blocTest(
//       'get personList',
//       build: () => personBloc,
//       act: (bloc) => bloc.add(PersonListGet()),
//       expect: () => [repository.mockList],
//     );
//   });
// }
