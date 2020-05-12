class HouseNumberValidador {
  String validate(String value) {
    String patttern = r'(^[0-9 ()\-]*$)';
    RegExp regExp = new RegExp(patttern);
    const requiredField = "O campo é obrigatorio";
    const onlyNumbers = "Precisa ser um número";

    if (value.isEmpty) {
      return requiredField;
    } else if (!regExp.hasMatch(value)) {
      return onlyNumbers;
    } else {
      return null;
    }
  }
}
