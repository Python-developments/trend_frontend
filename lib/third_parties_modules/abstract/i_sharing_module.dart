import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class ISharingModule extends IModule {
  Future<void> shareReferralCode({required final String referralCode});

  Future<void> shareProduct({
    required final String productName,
    required final String productSlug,
    required final String mainCategorySlug,
    required final String vendorSlug,
  });
}
