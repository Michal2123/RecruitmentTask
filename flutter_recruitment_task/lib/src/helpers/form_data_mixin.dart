import 'package:flutter_recruitment_task/src/model/group_model.dart';
import 'package:flutter_recruitment_task/src/model/person_model.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';

mixin FormData {
  Map<String, String?> formData = {};

  ///Collect data from TextFormFields and store them in [fromData].
  saveFormData(Map<String, String?> data) {
    formData.addAll(data);
  }

  ///Function clears [formData] userd to store form data.
  clearFormData() {
    formData = {};
  }

  ///Takes [id] and [groups] parameters and creates new person object using saved data
  ///from [formData].
  PersonModel parseToPersonModel({String? id, List<PersonGroupModel>? groups}) {
    return PersonModel(
        id: id,
        firstName: formData[PersonFieldName.firstName.name] ?? '',
        lastName: formData[PersonFieldName.lastName.name] ?? '',
        birthDate: formData[PersonFieldName.birthDate.name] ?? '',
        zipCode: formData[PersonFieldName.zipCode.name] ?? '',
        city: formData[PersonFieldName.city.name] ?? '',
        street: formData[PersonFieldName.street.name] ?? '',
        personGroupList: groups ?? <PersonGroupModel>[]);
  }

  ///Takes [id] and [members] parameters and creates new group object usnig saved data
  ///from [formData].
  GroupModel parseToGroupModel({String? id, List<GroupMemberModel>? members}) {
    return GroupModel(
        id: id,
        groupName: formData[GroupFieldName.groupName.name] ?? '',
        groupMemberList: members ?? <GroupMemberModel>[]);
  }
}
