import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
        firstName: json['firstName'],
        lastName: json['lastName'],
        birthDate: json['birthDate'],
        zipCode: json['zipCode'],
        city: json['city'],
        street: json['street'],
        groups: json['groups']);
  }

  @override
  List<Object> get props => [];
}
