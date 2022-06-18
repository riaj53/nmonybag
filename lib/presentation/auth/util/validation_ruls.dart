class ValidationRuls {
  static String? email(String? text) {
    if (text == null || text.isEmpty) {
      return 'please write somthing';
    } else if (!text.contains('@')) {
      return 'please write valid Email';
    } else {
      return null;
    }
  }

  static String? password(String? text) {
    if (text == null || text.isEmpty) {
      return 'please writing something';
    } else if (text.length < 8) {
      return 'password should be minimum 8';
    } else {
      return null;
    }
  }

  static String? regular(String? text) {
    if (text == null || text.isEmpty) {
      return 'please write something';
    }
    return null;
  }
}
