class PhoneValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    const invalidPhone = "Número de telefone inválido";
    String patttern = r'(^[0-9 ()\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return requiredField;
    } else if (!regExp.hasMatch(value) || value.length < 14) {
      return invalidPhone;
    } else {
      return null;
    }
  }
}
