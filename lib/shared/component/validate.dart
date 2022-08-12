
// import '../feature/login/controller.dart';

class Validator {
  static String? email(String? value) {
    if (value!.isEmpty) {
      return 'Email Empty!';
    } else if (!value.contains('@') || !value.contains('.com')) {
      return 'EX: example@example.com';
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    if (value!.isEmpty) {
      return 'Password Empty!';
    } else if (value.length < 6 ) {
      return 'Password must be at least 6 digit';
    } else {
      return null;
    }

  }
  static String? title(String? value) {
    if (value!.isEmpty) {
      return 'Title Empty!';
    } else if (value.length < 8) {
      return 'Title  must contain at least 8 characters';
    } else {
      return null;
    }

  }
  static String? time(String? value) {
    if (value!.isEmpty) {
      return 'Time Empty!';
    } else if (value.length <= 2) {
      return 'Time invalid';
    } else {
      return null;
    }


  }
  static String? date(String? value) {
    if (value!.isEmpty) {
      return 'Date Empty!';
    } else if (value.length <= 2) {
      return 'Date invalid';
    } else {
      return null;
    }

  }
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
