extension StringExtenstion on String {
  String get getLastCharacter {
    if (length > 1) {
      return substring(length - 1, length);
    } else {
      return '';
    }
  }
}
