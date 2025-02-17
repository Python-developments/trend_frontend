import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:trend/dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(final String flavorName) =>
    $initGetIt(getIt, environment: flavorName);
