import 'package:flutter/material.dart';
import 'package:ladangsantara/app/themes/theme.dart';

class HeadingText extends StatelessWidget {
  String? leftText;
  String? rightText;
  double? fontSize;
  VoidCallback? onPressRightText;
  HeadingText({
    super.key,
    this.leftText,
    this.rightText,
    this.onPressRightText,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          leftText ?? "Left Text",
          style: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w600,
            color: ThemeApp.neutralColor,
          ),
        ),
        InkWell(
          onTap: onPressRightText,
          child: Text(
            rightText ?? "Right Text",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: fontSize ?? 14,
            ),
          ),
        )
      ],
    );
  }
}
