mixin FormFielValidation {
  birthDateFieldValidation(String? value) {
    if (value != null && value.length < 10) {
      return 'Wypełnij pole';
    }
    return null;
  }

  simpleFieldValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Wypełnij pole';
    }
    return null;
  }

  zipCodeFieldValidation(String? value) {
    if (value != null && value.length < 6) {
      return 'Wypełnij pole';
    }
    return null;
  }
}
