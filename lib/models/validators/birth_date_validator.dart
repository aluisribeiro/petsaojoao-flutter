class BirthDateValidator {
  String validate(String value) {
    const breedInvalid = "Data inválida";
    const requiredField = "O campo é obrigatorio";
    var dateNow = new DateTime.now();
    var yearNow = dateNow.toString().substring(0, 4);

    if (value.isEmpty) {
      return requiredField;
    } else {
      if (value.length < 10) {
        return breedInvalid;
      } else {
        var day = value.substring(0, 2);
        var month = value.substring(3, 5);
        var year = value.substring(6, 10);

        if (int.parse(year) > int.parse(yearNow) || int.parse(year) < 2000) {
          return breedInvalid;
        } else if (int.parse(day) > 31 || int.parse(day) < 1) {
          return breedInvalid;
        } else if (int.parse(month) > 12 || int.parse(month) < 1) {
          return breedInvalid;
        } else {
          return null;
        }
      }
    }
  }
}

// class BirthDateValidator {
//   String validate(String value) {
//     const breedInvalid = "Data inválida";
//     const requiredField = "O campo é obrigatorio";

//     // var dateNow = new DateTime.now();
//     //  var yearNow = dateNow.toString().substring(0, 4);

//     var day = value.substring(0, 2);
//     var month = value.substring(3, 5);
//     var year = value.substring(6, 10);

//     if (value.isEmpty) {
//       return requiredField;
//     } else {
//       return null;
//     }
//   }
// }

// else if (int.parse(year) > int.parse(yearNow) || int.parse(year) < 2000) {
//   return breedInvalid;
// }
// else if (int.parse(day) > 31 || int.parse(day) < 1) {
//   return breedInvalid;
// }
// else if (int.parse(month) > 12 || int.parse(month) < 1) {
//   return breedInvalid;
// }
// else if (value.length < 10) {
//   return breedInvalid;
// }
