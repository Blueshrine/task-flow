import 'package:flutter/material.dart';

import '../ui/styles/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final String content;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const CustomTextButton({
    super.key,
    required this.content,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(content, style: context.appTextStyles.textBold),
    );
  }
}
