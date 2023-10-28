import 'package:korean_profanity_filter/korean_profanity_filter.dart';

abstract class Regex {
  Regex._();

  // 공백 존재 여부
  static bool hasSpaceOnString(String value) {
    return RegExp(r'\s').hasMatch(value);
  }

  /// 적합한 문자 사용 여부
  /// 한글, 알파벳, 숫자, 언더스코어(_), 하이픈(-)만 사용할 수 있음
  static bool hasProperCharacter(String value) {
    return !RegExp(r'^[a-zA-Z0-9ㄱ-ㅎ가-힣_-]+$').hasMatch(value.trim());
  }

  static bool hasFWords(String value) {
    return value.containsBadWords;
  }

  // Operation 글자 포함 여부
  static bool hasContainOperationWord(String value) {
    return RegExp('운영자|관리자').hasMatch(value.trim());
  }
}
