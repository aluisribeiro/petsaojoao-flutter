class SizePetValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    if (value == null) {
      return requiredField;
    } else {
      return null;
    }
  }
}
