mixin FormData {
  Map<String, String?> formData = {};
  saveFormData(Map<String, String?> data) {
    formData.addAll(data);
  }

  clearFormData() {
    formData = {};
  }
}
