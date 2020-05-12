class WhatsappValidator {
  String validate(String value) {
    const invalidWhatsapp = "Número de Whatsapp inválido";
    String patttern = r'(^[0-9 ()\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return null;
    } else if (!regExp.hasMatch(value) || value.length < 15) {
      return invalidWhatsapp;
    } else {
      return null;
    }
  }
}
