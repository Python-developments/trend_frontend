
import 'package:flutter/material.dart';

abstract class IDeepLinkingModule {
  // the link that launched the application from terminated state
  String? initialLink;
  Future<void> init({required BuildContext context});
  Future<void> handleLink(final String link,BuildContext context);

}
