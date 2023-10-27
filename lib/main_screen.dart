import 'package:flutter/material.dart';
import 'package:simple_nickname_validation_implementation/main_controller.dart';
import 'package:simple_nickname_validation_implementation/src/app_color.dart';
import 'package:simple_nickname_validation_implementation/src/app_text_style.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.controller}) : super(key: key);

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        toolbarHeight: 56,
        elevation: 0,
        leading: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: IconButton(
            onPressed: () {
              controller.showNoFeatureAlert(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.mixedWhite,
            ),
          ),
        ),
        title: Text(
          '프로필 설정',
          style: AppTextStyle.title2,
        ),
        actions: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: TextButton(
              onPressed: () {
                controller.onSaveBtnTapped(context);
              },
              child: Text(
                '저장',
                style: AppTextStyle.title2
                    .copyWith(fontFamily: 'pretendard_medium'),
              ),
            ),
          )
        ],
        backgroundColor: AppColor.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16),

              // 프로필 이미지
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.showNoFeatureAlert(context);
                    },
                    child: Container(
                      height: 84,
                      width: 84,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/avatar.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        controller.showNoFeatureAlert(context);
                      },
                      child: Container(
                        color: Colors.black.withOpacity(0.6),
                        height: 20,
                        width: 84,
                        child: Center(
                          child: Opacity(
                            opacity: 0.9,
                            child: Text(
                              '변경',
                              style: AppTextStyle.alert2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 24),

              // 닉네임 입력 Field
              Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                  controller: controller.textEditingController,
                  validator: controller.nickNameValidation,
                  onFieldSubmitted: (_) {},
                  keyboardAppearance: Brightness.dark,
                  onChanged: (_) {},
                  cursorColor: AppColor.lightGrey,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'pretendard_regular',
                  ),
                  decoration: InputDecoration(
                    border: _outLinedBorder(),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 18, right: 40),
                    hintText: '닉네임을 입력해주세요',
                    errorBorder: _errorBorder(),
                    focusedErrorBorder: _errorBorder(),
                    enabledBorder: _outLinedBorder(),
                    disabledBorder: _fixedOutLinedBorder(),
                    focusedBorder: _outLinedBorder(),
                    fillColor: AppColor.strongGrey,
                    errorStyle:
                        AppTextStyle.alert2.copyWith(color: AppColor.red),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: AppColor.lightGrey.withOpacity(0.4),
                      fontFamily: 'pretendard_regular',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _errorBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.red, width: 0.6),
    );
  }

  OutlineInputBorder _outLinedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.4), // 테두리 색상
        width: 0.6, // 테두리 너비
      ),
    );
  }

  // [TextField] OutLinedBorder 속성
  OutlineInputBorder _fixedOutLinedBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
