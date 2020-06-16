class BreedValidator {
  String validate(String value) {
    const breedInvalid = "Raça inválida";
    const requiredField = "O campo é obrigatorio";
    if (value == null) {
      return requiredField;
    } else {
      return null;
    }
  }
}
