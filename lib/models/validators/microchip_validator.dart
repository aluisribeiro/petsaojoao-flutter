class MicrochipValidator {
  String validate(String value) {
    const microchipInvalid = "Número do microchip inválido";
    if (value.length == 1) {
      return microchipInvalid;
    } else {
      return null;
    }
  }
}
