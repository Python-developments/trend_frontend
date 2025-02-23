import 'dart:async';

import 'package:share_plus/share_plus.dart';
import 'package:trend/third_parties_module/abstract/i_sharing_module.dart';


class SharingModule extends ISharingModule {
  SharingModule();
  @override
  Future<void> sharePost({
    required final int postId
  }) async {
    final String shareLink = 'Trend-ssm.com/posts/$postId';
    await Share.share(
      'Check out this post on trend $shareLink',
    );
  }
}
