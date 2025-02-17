import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class IDeepLinkingModule extends IModule {
  // the link that launched the application from terminated state
  String? initialLink;
  Future<void> init();
  Future<void> handleLink(
    final String link,
  );
}
