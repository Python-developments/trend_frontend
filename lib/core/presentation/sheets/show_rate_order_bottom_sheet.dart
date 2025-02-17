import 'package:trend/core/presentation/arguments/rate_order_bottom_sheet_arguments.dart';
import 'package:trend/core/presentation/sheets/show_custom_bottom_sheet.dart';
import 'package:trend/features/orders/presentation/sheets_and_popups/rate_order_bottom_sheet.dart';

Future<void> showRateOrderBottomSheet(
        {required final String orderId,
        required final void Function()? pageRefresher}) =>
    showCustomBottomSheet(
      sheetTitle: 'Rate order',
      sheetWidget: RateOrderBottomSheet(
          args: RateOrderBottomSheetArguments(
              orderId: orderId, pageRefresher: pageRefresher)),
      height: 400,
      onDismissDialog: () {},
    );
