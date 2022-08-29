///////////  Start Validator class /////////////
class Validator {
  //////  Start Validator Email ///////
  static String? email(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email address';
    } else if (!value.contains('@') || !value.contains('.com')) {
      return 'EX: example@example.com';
    } else {
      return null;
    }
  }
  //////  End Validator Email ///////

  //////  Start Validator Password ///////

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 digit';
    } else {
      return null;
    }
  }
  //////  End Validator Password ///////

  //////  Start Validator Title ///////
  static String? name(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 8) {
      return 'name must contain at least 8 characters';
    } else {
      return null;
    }
    //////  End Validator Title ///////
  }

  //////  Start Validator Time ///////
  static String? time(String? value) {
    if (value!.isEmpty) {
      return 'Time Empty!';
    } else if (value.length <= 2) {
      return 'Time invalid';
    } else {
      return null;
    }
  }
  //////  End Validator Time ///////
  //////  Start Validator phone ///////
  static String? mobilePhone(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    // ignore: prefer_is_empty
    if (value!.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
  //////  End Validator phone ///////
  //////  Start Validator Date ///////
  static String? date(String? value) {
    if (value!.isEmpty) {
      return 'Date Empty!';
    } else if (value.length <= 2) {
      return 'Date invalid';
    } else {
      return null;
    }
  }
//////  End Validator Date ///////

// static String? confirmPassword(String? value) {
//   if (value!.isEmpty) {
//     return 'Invalid Confirm!';
//   } else if (LoginController().password !=LoginController().confirm) {
//     return 'please enter match password';
//   } else {
//     return null;
//   }
// }

}
///////////  End Validator class /////////////
