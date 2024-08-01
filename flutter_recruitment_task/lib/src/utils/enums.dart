enum InputFormatters {
  zipCode,
  birthDate,
  none;
}

enum PersonStatus { initial, loading, succes, error }

enum GroupStatus { initial, loading, succes, error }

enum PersonFieldName {
  firstName,
  lastName,
  birthDate,
  zipCode,
  city,
  street,
  personGroupList;
}

enum GroupFieldName {
  groupName,
  groupMemberList;
}

enum DatabaseTables { tablePerson, tableGroup }
