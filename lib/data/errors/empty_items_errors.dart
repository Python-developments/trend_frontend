import 'package:trend/core/presentation/assets.dart';
import 'package:trend/data/errors/custom_error.dart';

class EmptyProductsError extends CustomError {
  EmptyProductsError()
      : super(
            errorMessage: 'Oh!, We are sorry, products not found',
            errorImage: Assets.productsEmptyView);
}

class EmptyVendorsError extends CustomError {
  EmptyVendorsError()
      : super(
            errorMessage: 'Oh, there are no shops registered at your location',
            errorImage: Assets.vendorsEmptyView);
}

class EmptyOrdersError extends CustomError {
  EmptyOrdersError()
      : super(
            errorMessage: 'There are currently no orders placed',
            subtitle: 'Start shopping now to place your first order!',
            errorImage: Assets.productsEmptyView);
}

class EmptyAddressesError extends CustomError {
  EmptyAddressesError()
      : super(
            errorMessage: 'Oh, you have not added any addresses',
            errorImage: Assets.addressesEmptyView);
}

class EmptyCartError extends CustomError {
  EmptyCartError()
      : super(
            errorMessage: 'There are no items in your cart',
            subtitle: 'Start shopping now to add items',
            errorImage: Assets.cartEmptyView);
}

class EmptyNotificationsError extends CustomError {
  EmptyNotificationsError()
      : super(
            errorMessage: 'There are currently no notifications to display',
            errorImage: Assets.notificationsEmptyView);
}

class EmptyFavoritesError extends CustomError {
  EmptyFavoritesError()
      : super(
            errorMessage:
                'Hay, it looks like you have not added any products to the wishlist',
            errorImage: Assets.productsEmptyView);
}

class EmptyReviewsError extends CustomError {
  EmptyReviewsError()
      : super(
            errorMessage: 'Hay, there is no reviews for this shop',
            errorImage: Assets.reviewsEmptyView);
}

class EmptyEventsError extends CustomError {
  EmptyEventsError()
      : super(
            errorMessage: 'Hay, There are no special days scheduled currently',
            errorImage: Assets.eventsEmptyView);
}

class EmptySchedulingOptionsError extends CustomError {
  EmptySchedulingOptionsError()
      : super(
            errorMessage: 'No options to show',
            errorImage: Assets.eventsEmptyView);
}
