import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/flavors.dart';

part 'app_controller.g.dart';

@singleton
class AppController extends AppControllerBase with _$AppController {
  AppController(super.flavor,  super.authController,
      super.logger, super.appRouter, super.snakeBarShower);
}

abstract class AppControllerBase extends BaseController with Store {
  final Flavor flavor;
  final AuthController authController;
  AppControllerBase(this.flavor,this.authController,
      super.logger, super.appRouter, super.snakeBarShower);

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        await dotenv.load(fileName: '.env');

        await logger.init();

        await authController.loadData();
        if(authController.error!=null)
          throw authController.error!;
        if(authController.cachedUser==null)
          await appRouter.replace(LoginRoute());
        else
          await appRouter.replace(HomeRouteNavigation());
      }, onCatchError: (final _) async {
        await appRouter.replace(AppErrorRoute());
      });
}
