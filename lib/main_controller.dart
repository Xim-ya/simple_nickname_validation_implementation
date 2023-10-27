import 'package:flutter/material.dart';
import 'package:korean_profanity_filter/korean_profanity_filter.dart';
import 'package:simple_nickname_validation_implementation/src/app_text_style.dart';
import 'package:simple_nickname_validation_implementation/src/regex.dart';

class MainController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textEditingController = TextEditingController();

  void showNoFeatureAlert(context) {
    showSnackBar(context, text: '지원하지 않는 기능입니다.');
  }

  String? nickNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return '닉네임을 입력해주세요';
    } else if (Regex.hasSpaceOnString(value)) {
      return '닉네임에는 공백을 사용할 수 없습니다';
    } else if (value.trim().length < 2 || value.trim().length > 10) {
      return '닉네임은 2에서 10글자 사이여야 합니다';
    } else if (Regex.hasProperCharacter(value)) {
      return '닉네임에는 한글, 알파벳, 숫자, 언더스코어(_), 하이픈(-)만 사용할 수 있습니다';
    } else if (value.containsBadWords) {
      return '비속어, 욕설 단어는 사용할 수 없습니다';
    } else if (Regex.hasContainOperationWord(value)) {
      return '사용할 수 없는 닉네임 입니다';
    } else {
      return null;
    }
  }

  void onSaveBtnTapped(BuildContext context) {
    final value = textEditingController.text;

    if (value.isEmpty) {
      showSnackBar(context, text: '닉네임을 입력해주세요.');
    } else if (nickNameValidation(value) != null) {
      showSnackBar(context, text: '유효하지 않은 닉네임입니다.');
    } else {
      showSnackBar(context, text: '닉네임을 정상적으로 등록하였습니다.');
    }
  }

  void showSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(
          text,
          style: AppTextStyle.alert2,
        ),
      ),
    );
  }
}
