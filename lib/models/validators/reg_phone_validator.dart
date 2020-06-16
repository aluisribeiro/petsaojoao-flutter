class RegPhoneValidator {
  String validate(String value) {
    const invalidPhone = "Número de Telefone inválido";
    String patttern = r'(^[0-9 ()\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value) || value.length < 14) {
      return invalidPhone;
    } else {
      return null;
    }
  }
}
