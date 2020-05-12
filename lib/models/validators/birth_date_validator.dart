class BirthDateValidator {
  String validate(String value) {
    const breedInvalid = "Data inválida";
    const requiredField = "O campo é obrigatorio";
    if (value.isEmpty) {
      return requiredField;
    } else if (value.length < 10) {
      return breedInvalid;
    } else {
      return null;
    }
  }
}
