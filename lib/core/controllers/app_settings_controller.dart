import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/object_data_loader.dart';
import 'package:trend/core/presentation/dialogs/show_custom_dialog.dart';
import 'package:trend/core/presentation/dialogs/force_update_dialog.dart';
import 'package:trend/core/presentation/dialogs/optional_update_dialog.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/app_settings_model.dart';
import 'package:trend/data/repositories/abstract/i_utils_repository.dart';

import 'package:trend/core/presentation/dialogs/maintenance_alert_dialog.dart';

@singleton
class AppSettingsController extends ObjectDataLoader<AppSettingsModel> {
  final IUtilsRepository utilsRepository;
  AppSettingsController(
      this.utilsRepository,
      super.logger,super.appRouter,super.snakeBarShower  );

  @override
  bool get isLazyController => true;

  @override
  Future<AppSettingsModel> dataGetter() => utilsRepository.getAppSettings();

  Future<void> checkAppStatus() async {
    await Future.wait([
      _checkAppVersion(),
      _checkAppUnderMaintenance(),
    ]);
  }

  Future<void> _checkAppVersion() async {
    final ApplicationState currentApplicationState =await data!.applicationState;
    if (currentApplicationState == ApplicationState.mustUpdate) {
      await showCustomDialog(
        isDismissible: false,
        dialog: ForceUpdateDialog(),
      );
    } else if (currentApplicationState == ApplicationState.canUpdate) {
      await showCustomDialog(dialog: OptionalUpdateDialog());
    }
  }

  Future<void> _checkAppUnderMaintenance() async {
    if(data!.isUnderMaintenance)
    {
      await showCustomDialog(
        isDismissible: false,
        dialog: const MaintenanceAlertDialog(),
      );
    }
  }

}
