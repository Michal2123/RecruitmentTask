mixin FormFielValidation {
  ///Function validate [birthDate] form field, check if [value] is not null
  ///and if string length more then 9 chars.
  birthDateFieldValidation(String? value) {
    if (value != null && value.length > 9) {
      return null;
    }
    return 'Wypełnij pole';
  }

  ///Standard validation function, check if [value] is not null or not empty.
  simpleFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Wypełnij pole';
    }
    return null;
  }

  ///Function validate [zipCode] form field, check if [value] is not null
  ///and is string length is more than 5 chars.
  zipCodeFieldValidation(String? value) {
    if (value != null && value.length > 5) {
      return null;
    }
    return 'Wypełnij pole';
  }

  ///Function validate group of checkboxes, check if [value] list
  ///is not null and not empty and if any element of [value] list is true.
  checkboxListFieldValidation(List<bool?>? value) {
    if (value != null &&
        value.isNotEmpty &&
        !value.any((element) => element != null && element)) {
      return 'Check any person';
    }
    return null;
  }
}
