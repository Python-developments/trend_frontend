import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trend/shared/utiles/routes.dart';
import 'package:trend/third_parties_module/abstract/i_deep_linking_module.dart';
import 'package:uni_links2/uni_links.dart';

class DeepLinkingModule extends IDeepLinkingModule {
  StreamSubscription? appLinkStream;

  DeepLinkingModule();

  @override
  Future<void> init({required BuildContext context}) async {
    print('Wiso init deep linking');
    try {
      final Uri? linkUri = await getInitialUri();
      if (linkUri != null) {
        initialLink = linkUri.path;
        Future.delayed(Duration(seconds: 5)).then((_)=>handleLink(initialLink!,context));
      }

      appLinkStream = uriLinkStream.listen((final Uri? uri) {
        if (uri != null) {
          handleLink(uri.path,context);
        }
      });
    } catch (_) {}
  }

  @override
  Future<void> handleLink(final String link,BuildContext context) async {
    print('Wiso deep link $link');
    final List<String> splitedLink = link.split('/');
    if(splitedLink.length>=1 && splitedLink.first=='posts'){
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
    }
  }

  @override
  void dispose() {
    appLinkStream?.cancel();
  }
}
