class NamePetValidator {
  String validate(String value) {
    String patttern =
        r'(^[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇ ]*$)';
    RegExp regExp = new RegExp(patttern);
    const nameInvalid = "Nome inválido";
    const requiredField = "O campo é obrigatorio";
    if (value.isEmpty) {
      return requiredField;
    } else if (!regExp.hasMatch(value)) {
      return nameInvalid;
    } else {
      return null;
    }
  }
}
