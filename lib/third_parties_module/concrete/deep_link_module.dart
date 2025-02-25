import 'dart:async';

import 'package:flutter/material.dart';
import 'package:trend/features/posts/presentation/Pages/post_details_page.dart';
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
    final List<String> splitedLink = link.split('/');
    print('Wiso deep link $splitedLink');
    if(splitedLink.first.isEmpty)
      splitedLink.removeAt(0);
    print('Wiso splitedLink.length >= 2 ${splitedLink.length >= 2}');
    print('Wiso splitedLink.first==posts ${splitedLink.first=='posts'}');
    print('Wiso int.tryParse(splitedLink[1])!=null ${int.tryParse(splitedLink[1])!=null}');
    if(splitedLink.length>=2 && splitedLink.first=='posts'&& int.tryParse(splitedLink[1])!=null){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PostDetailsPage(postId:int.parse(splitedLink[1])),
        ),
      );
    }
  }

  @override
  void dispose() {
    appLinkStream?.cancel();
  }
}
