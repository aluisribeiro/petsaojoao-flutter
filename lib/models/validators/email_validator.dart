class EmailValidator {
  String validate(String value) {
    const invalidEmail = "E-mail inválido";
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value)) {
      return invalidEmail;
    } else {
      return null;
    }
  }
}
