import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:uuid/uuid.dart';

@immutable
final class PersonModel extends Equatable {
  PersonModel(
      {String? id,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.zipCode,
      required this.city,
      required this.street,
      List<PersonGroupModel>? personGroupList})
      : assert(id == null || id.isNotEmpty, 'id must be null or not empty'),
        id = id ?? const Uuid().v4(),
        personGroupList = personGroupList ?? <PersonGroupModel>[];

  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String zipCode;
  final String city;
  final String street;
  final List<PersonGroupModel> personGroupList;

  PersonModel copyWith(
      {String? firstName,
      String? lastName,
      String? birthDate,
      String? zipCode,
      String? city,
      String? street,
      List<PersonGroupModel>? personGroupList}) {
    return PersonModel(
        id: id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        birthDate: birthDate ?? this.birthDate,
        zipCode: zipCode ?? this.zipCode,
        city: city ?? this.city,
        street: street ?? this.street,
        personGroupList: personGroupList ?? this.personGroupList);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      PersonFieldName.firstName.name: firstName,
      PersonFieldName.lastName.name: lastName,
      PersonFieldName.birthDate.name: birthDate,
      PersonFieldName.zipCode.name: zipCode,
      PersonFieldName.city.name: city,
      PersonFieldName.street.name: street,
      PersonFieldName.personGroupList.name: personGroupList,
    };
  }

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    var personGroup =
        List<dynamic>.from(json[PersonFieldName.personGroupList.name])
            .map((e) => PersonGroupModel.fromJson(e))
            .toList();
    return PersonModel(
        id: json['id'],
        firstName: json[PersonFieldName.firstName.name],
        lastName: json[PersonFieldName.lastName.name],
        birthDate: json[PersonFieldName.birthDate.name],
        zipCode: json[PersonFieldName.zipCode.name],
        city: json[PersonFieldName.city.name],
        street: json[PersonFieldName.street.name],
        personGroupList: personGroup);
  }

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        birthDate,
        zipCode,
        city,
        street,
        personGroupList
      ];
}

final class PersonGroupModel extends Equatable {
  const PersonGroupModel({required this.id, required this.groupName});
  final String id;
  final String groupName;

  factory PersonGroupModel.fromJson(Map<String, dynamic> json) {
    return PersonGroupModel(id: json['id'], groupName: json['groupName']);
  }
  @override
  List<Object> get props => [id, groupName];
}
