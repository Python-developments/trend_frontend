import 'dart:ui';

import 'package:flutter/material.dart';

class customBackdropFilter extends StatelessWidget {
  const customBackdropFilter(
      {super.key});

  @override
  Widget build(final BuildContext context) {
    return BackdropFilter(
      filter:
          ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0), // تأثير الضبابية
      child: Container(
        color: Colors.black.withOpacity(0), // الشفافية
      ),
    );
  }
}
