class RegEmailValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    const invalidEmail = "E-mail inválido";
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return requiredField;
    } else if (!regExp.hasMatch(value)) {
      return invalidEmail;
    } else {
      return null;
    }
  }
}
