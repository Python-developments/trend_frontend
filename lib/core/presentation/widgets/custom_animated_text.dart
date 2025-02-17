import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const CustomAnimatedText(this.text,
      {required this.style, this.textAlign, super.key});

  @override
  Widget build(final BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Text(
        key: ValueKey(text),
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}
