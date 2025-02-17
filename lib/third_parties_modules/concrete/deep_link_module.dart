import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:uni_links2/uni_links.dart';
import 'package:trend/core/presentation/arguments/product_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/register_page_arguments.dart';
import 'package:trend/core/presentation/arguments/vendor_products_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/clients/abstract/i_http_client.dart';
import 'package:trend/third_parties_modules/abstract/i_deep_linking_module.dart';

@Singleton(as: IDeepLinkingModule)
class DeepLinkingModule extends IDeepLinkingModule {
  final IHttpClient httpClient;
  final AppRouter appRouter;
  final SnakeBarShower snakeBarShower;
  StreamSubscription? appLinkStream;

  DeepLinkingModule(this.httpClient, this.appRouter, this.snakeBarShower);

  @override
  Future<void> init() async {
    try {
      final Uri? linkUri = await getInitialUri();
      if (linkUri != null) {
        initialLink = linkUri.path;
      }

      appLinkStream = uriLinkStream.listen((final Uri? uri) {
        if (uri != null) {
          handleLink(uri.path);
        }
      });
    } catch (_) {}
  }

  @override
  Future<void> handleLink(final String link) async {
    link.debugPrint();
    final List<String> splitedLink = link.split('/');
    final int productIndex = splitedLink.indexOf('p');
    if (productIndex != -1) {
      appRouter.popUntilRoot();
      await appRouter.redirectToRoutes([
        CategoryVendorsRoute(selectedCategory: splitedLink[productIndex + 1]),
        VendorProductsRoute(
            args: VendorDetailsPageArguments(
                vendorId: splitedLink[productIndex + 2])),
        ProductDetailsRoute(
            args: ProductDetailsPageArguments(
                isFromDeepLink: true,
                productId: splitedLink[productIndex + 3],
                defaultImage: null,
                productsPageRefresher: null,
                initialItemIndex: 0))
      ]);
      return;
    }

    final int orderIndex = splitedLink.indexOf('orders');
    if (orderIndex != -1) {
      await appRouter.redirectToRoute(OrderDetailsRoute(
        orderId: splitedLink[orderIndex + 1],
      ));
      return;
    }

    final int referralCodeIndex = splitedLink.indexOf('referralCode');
    if (referralCodeIndex != -1) {
      if (httpClient.userToken.isNotEmpty) {
        snakeBarShower.showSnakeBar(SnakeBarMessages.alreadyRegistered, ToastType.error);
      } else {
        await appRouter.redirectToRoute(RegisterRoute(
            args: RegisterPageArguments(
                sharedReferralCode: splitedLink[referralCodeIndex + 1])));
      }
      return;
    }
  }

  @disposeMethod
  @override
  void dispose() {
    appLinkStream?.cancel();
  }
}
