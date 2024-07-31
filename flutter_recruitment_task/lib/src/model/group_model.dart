import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:uuid/uuid.dart';

@immutable
class GroupModel extends Equatable {
  GroupModel(
      {String? id, required this.groupName, required this.groupMemberList})
      : assert(id == null || id.isNotEmpty, 'id must be null or not empty'),
        id = id ?? const Uuid().v4();
  final String id;
  final String groupName;
  final List<GroupMemberModel> groupMemberList;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      GroupFieldName.groupName.name: groupName,
      GroupFieldName.groupMemberList.name: groupMemberList,
    };
  }

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    var groupMemberList =
        List<dynamic>.from(json[GroupFieldName.groupMemberList.name])
            .map((e) => GroupMemberModel.fromJson(e))
            .toList();
    return GroupModel(
        id: json['id'],
        groupName: json[GroupFieldName.groupName.name],
        groupMemberList: groupMemberList);
  }

  @override
  List<Object?> get props => [id, groupName, groupMemberList];
}

@immutable
class GroupMemberModel extends Equatable {
  const GroupMemberModel(
      {required this.id, required this.firstName, bool? isCheck})
      : isCheck = isCheck ?? true;
  final String id;
  final String firstName;
  final bool isCheck;

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) {
    return GroupMemberModel(id: json['id'], firstName: json['firstName']);
  }

  @override
  List<Object?> get props => [id, firstName, isCheck];
}
