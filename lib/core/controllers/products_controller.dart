import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/data/models/products/product_model.dart';

import 'package:trend/data/repositories/abstract/i_products_repository.dart';

abstract class ProductsController
    extends PaginationListDataLoader<ProductModel> {
  final IProductsRepository productsRepository;

  ProductsController(this.productsRepository, super.logger,super.appRouter,super.snakeBarShower);
}
