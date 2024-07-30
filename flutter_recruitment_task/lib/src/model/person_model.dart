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
      required this.groups})
      : assert(id == null || id.isNotEmpty, 'id must be null or not empty'),
        id = id ?? const Uuid().v4();

  final String id;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String zipCode;
  final String city;
  final String street;
  final List<dynamic> groups;

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        id: json['id'],
        firstName: json[PersonFieldName.firstName.name],
        lastName: json[PersonFieldName.lastName.name],
        birthDate: json[PersonFieldName.birthDate.name],
        zipCode: json[PersonFieldName.zipCode.name],
        city: json[PersonFieldName.city.name],
        street: json[PersonFieldName.street.name],
        groups: json[PersonFieldName.groups.name]);
  }

  @override
  List<Object> get props => [];
}
