String? validator(
    String? value, String? validationString, validationCondition) {
  if (validationCondition) {
    return validationString;
  }
  return null;
}
