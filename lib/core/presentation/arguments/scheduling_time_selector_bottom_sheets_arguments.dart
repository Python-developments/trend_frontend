import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/orders/scheduling_date_option_model.dart';

class SchedulingDateSelectorBottomSheetArguments {
  final SchedulingDateOptionModel? selectedSchedulingOption;
  final void Function(SchedulingDateOptionModel) onSelectSchedulingOption;
  final DateTime startSchedulingDate;
  final OrderType selectedOrderType;

  SchedulingDateSelectorBottomSheetArguments(
      {required this.onSelectSchedulingOption,
      required this.selectedOrderType,
      required this.selectedSchedulingOption,
      required this.startSchedulingDate});
}
