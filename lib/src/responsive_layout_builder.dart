import 'package:flutter/material.dart';
import 'package:simple_nickname_validation_implementation/src/app_color.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder(this.context, this.child, {super.key});

  final BuildContext context;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Stack(
            children: [
              Container(
                color: AppColor.black, // 검정색 배경
              ),
              Center(
                child: Container(
                  width: 375, // 가운데 화면의 너비
                  height: 812, // 가운데 화면의 높이
                  child: child,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColor.newBlack,
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                    border: Border.all(
                      color: AppColor.newBlack,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return child!;
        }
      },
    );
  }
}
