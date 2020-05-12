import 'package:logger/logger.dart';

class FullNameValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    const nameInvalid = "Nome precisa ser completo";
    const okValidate = "Ok! Nome Passou";
    var namelogger = Logger(printer: PrettyPrinter());
    String patttern =
        r'(^[a-zA-ZàèìòùÀÈÌÒÙáéíóúýÁÉÍÓÚÝâêîôûÂÊÎÔÛãñõÃÑÕäëïöüÿÄËÏÖÜŸçÇ ]*$)';
    RegExp regExp = new RegExp(patttern);
    var ind = value.indexOf(" ");

    if (value.isEmpty) {
      return requiredField;
    } else if (!regExp.hasMatch(value) || value.length < 5 || ind == -1) {
      return nameInvalid;
    } else {
      namelogger.i("$okValidate");
      return null;
    }
  }
}
