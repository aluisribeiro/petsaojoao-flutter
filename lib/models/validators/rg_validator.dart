import 'package:logger/logger.dart';

class RgValidator {
  String validate(String value) {
    const requiredField = "O campo é obrigatorio";
    const rgInvalid = "RG inválido";
    const okValidate = "Ok! RG Passou";
    var rglogger = Logger(printer: PrettyPrinter());

    if (value.isEmpty) {
      return requiredField;
    } else if (value.length != 10) {
      return rgInvalid;
    } else {
      switch (value) {
        case "12.345.678":
          {
            return rgInvalid;
          }
          break;
        case "00.000.000":
          {
            return rgInvalid;
          }
          break;

        case "11.111.111":
          {
            return rgInvalid;
          }
          break;

        case "22.222.222":
          {
            return rgInvalid;
          }
          break;

        case "33.333.333":
          {
            return rgInvalid;
          }
          break;

        case "44.444.444":
          {
            return rgInvalid;
          }
          break;

        case "55.555.555":
          {
            return rgInvalid;
          }
          break;
        case "66.666.666":
          {
            return rgInvalid;
          }
          break;
        case "77.777.777":
          {
            return rgInvalid;
          }
          break;

        case "88.888.888":
          {
            return rgInvalid;
          }
          break;

        case "99.999.999":
          {
            return rgInvalid;
          }
          break;

        default:
          {
            rglogger.i("$okValidate");
            return null;
          }
      }
    }
  }
}
