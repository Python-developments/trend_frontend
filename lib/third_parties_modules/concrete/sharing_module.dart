import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

import 'package:share_plus/share_plus.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/third_parties_modules/abstract/i_sharing_module.dart';

@Singleton(as: ISharingModule)
class SharingModule extends ISharingModule {
  SharingModule();
  @override
  Future<void> shareProduct({
    required final String productName,
    required final String productSlug,
    required final String mainCategorySlug,
    required final String vendorSlug,
  }) async {
    final String sharableLink =
        '${dotenv.get('websiteUrl')}/p/$mainCategorySlug/$vendorSlug/$productSlug';
    await Share.share(
      '${'Check out'} $productName ${'available now in WOW VIR store'} $sharableLink',
    );
  }

  @override
  Future<void> shareReferralCode({required final String referralCode}) async {
    final String generatedSharingLink =
        '${dotenv.get('websiteUrl')}/referralCode/$referralCode';
    await Share.share(
        '${'Download WOW VIR application and use my referral code'} ( $referralCode )'
        '${"so we can both enjoy discounts and offers!"} $generatedSharingLink');
  }
}
