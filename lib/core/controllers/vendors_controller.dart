import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/empty_items_errors.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';
import 'package:trend/data/repositories/abstract/i_vendors_repository.dart';

abstract class VendorsController extends PaginationListDataLoader<VendorModel> {
  final IVendorsRepository vendorsRepository;

  VendorsController(
    this.vendorsRepository,
    super.logger,super.appRouter,super.snakeBarShower  );

  @override
  CustomError? get emptyError => EmptyVendorsError();
}
