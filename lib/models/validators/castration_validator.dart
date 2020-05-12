class CastrationValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    if (value.isEmpty) {
      return requiredField;
    } else {
      return null;
    }
  }
}
