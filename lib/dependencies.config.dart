// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/controllers/app_controller.dart' as _i26;
import 'core/controllers/auth_controller.dart' as _i710;
import 'core/controllers/text_field_dialog_controller.dart' as _i828;
import 'core/presentation/arguments/confirm_receiver_page_arguments.dart'
    as _i1044;
import 'core/presentation/arguments/submit_new_password_arguments.dart'
    as _i781;
import 'core/presentation/arguments/submit_receiver_page_arguments.dart'
    as _i888;
import 'core/presentation/router/auto_router.dart' as _i658;
import 'core/presentation/snake_bars/bottom_snack_bar.dart' as _i573;
import 'core/utils/flavors.dart' as _i463;
import 'data/clients/abstract/i_http_client.dart' as _i768;
import 'data/clients/concrete/http_client.dart' as _i1015;
import 'data/local_database/databases/abstract/i_app_local_database.dart'
    as _i528;
import 'data/local_database/databases/concrete/app_local_database.dart'
    as _i643;
import 'data/repositories/abstract/i_auth_repository.dart' as _i762;
import 'data/repositories/abstract/i_posts_repository.dart' as _i1069;
import 'data/repositories/abstract/i_profile_repository.dart' as _i1007;
import 'data/repositories/abstract/i_utils_repository.dart' as _i251;
import 'data/repositories/concrete/auth_repository.dart' as _i189;
import 'data/repositories/concrete/posts_repository.dart' as _i580;
import 'data/repositories/concrete/profile_repository.dart' as _i241;
import 'data/repositories/concrete/utils_repository.dart' as _i1062;
import 'features/add_post/controllers/create_post_controller.dart' as _i57;
import 'features/auth/controllers/confirm_otp_controller.dart' as _i50;
import 'features/auth/controllers/login_controller.dart' as _i701;
import 'features/auth/controllers/register_controller.dart' as _i656;
import 'features/auth/controllers/submit_new_password_controller.dart' as _i524;
import 'features/auth/controllers/submit_receiver_controller.dart' as _i752;
import 'features/home/controllers/bottom_navigator_controller.dart' as _i665;
import 'third_parties_modules/abstract/i_crop_image_module.dart' as _i859;
import 'third_parties_modules/abstract/i_http_requestor_module.dart' as _i669;
import 'third_parties_modules/abstract/i_image_picking_module.dart' as _i964;
import 'third_parties_modules/abstract/i_internet_connection_module.dart'
    as _i103;
import 'third_parties_modules/abstract/i_logger_module.dart' as _i1037;
import 'third_parties_modules/abstract/i_native_device_store_module.dart'
    as _i518;
import 'third_parties_modules/abstract/i_permissions_handler_module.dart'
    as _i661;
import 'third_parties_modules/abstract/i_sharing_module.dart' as _i812;
import 'third_parties_modules/concrete/crop_image_module.dart' as _i985;
import 'third_parties_modules/concrete/http_requestor_module.dart' as _i72;
import 'third_parties_modules/concrete/image_picking_module.dart' as _i726;
import 'third_parties_modules/concrete/internet_connection_module.dart'
    as _i235;
import 'third_parties_modules/concrete/logger_module.dart' as _i728;
import 'third_parties_modules/concrete/native_device_store_module.dart'
    as _i380;
import 'third_parties_modules/concrete/permissions_handler_module.dart'
    as _i400;
import 'third_parties_modules/concrete/sharing_module.dart' as _i798;

const String _ProductionFlavor = 'ProductionFlavor';
const String _DevelopingFlavor = 'DevelopingFlavor';
const String _StagingFlavor = 'StagingFlavor';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appRouterModule = _$AppRouterModule();
  final connectivityPackage = _$ConnectivityPackage();
  gh.singleton<_i463.Flavor>(
    () => _i463.ProductionFlavor(),
    registerFor: {_ProductionFlavor},
  );
  gh.singleton<_i463.Flavor>(
    () => _i463.DevelopingFlavor(),
    registerFor: {_DevelopingFlavor},
  );
  gh.singleton<_i463.Flavor>(
    () => _i463.StagingFlavor(),
    registerFor: {_StagingFlavor},
  );
  gh.singleton<_i658.AppRouter>(() => appRouterModule.getAppRouter);
  gh.singleton<_i573.SnakeBarShower>(() => _i573.SnakeBarShower());
  gh.singleton<_i895.Connectivity>(() => connectivityPackage.connectivity);
  gh.singleton<_i661.IPermissionsHandlerModule>(
      () => _i400.PermissionsHandlerModule());
  gh.singleton<_i518.INativeDeviceStoreModule>(
      () => _i380.NativeDeviceStoreModule());
  gh.singleton<_i859.ICropImageModule>(() => _i985.CropImageModule());
  gh.singleton<_i103.IInternetConnectionModule>(
    () => _i235.InternetConnectionModule(gh<_i895.Connectivity>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i528.IAppLocalDatabase>(() => _i643.AppLocalDatabase());
  gh.singleton<_i812.ISharingModule>(() => _i798.SharingModule());
  gh.singleton<_i1037.ILoggerModule>(
      () => _i728.LoggerModule(gh<_i463.Flavor>()));
  gh.factoryParam<_i50.ConfirmOtpController,
      _i1044.ConfirmReceiverPageArguments, dynamic>((
    args,
    _,
  ) =>
      _i50.ConfirmOtpController(
        args,
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.singleton<_i669.IHttpRequestorModule>(
      () => _i72.HttpRequestorModule(gh<_i463.Flavor>()));
  gh.factoryParam<_i665.BottomNavigatorController, int, dynamic>((
    index,
    _,
  ) =>
      _i665.BottomNavigatorController(index));
  gh.singleton<_i768.IHttpClient>(() => _i1015.HttpClient(
        gh<_i669.IHttpRequestorModule>(),
        gh<_i103.IInternetConnectionModule>(),
      ));
  gh.singleton<_i762.IAuthRepository>(() => _i189.AuthRepository(
        gh<_i463.Flavor>(),
        gh<_i768.IHttpClient>(),
        gh<_i528.IAppLocalDatabase>(),
        gh<_i1037.ILoggerModule>(),
      ));
  gh.singleton<_i964.IImagePickingModule>(() => _i726.ImagePickingModule(
        gh<_i661.IPermissionsHandlerModule>(),
        gh<_i859.ICropImageModule>(),
      ));
  gh.factoryParam<_i828.TextFieldDialogController, _i828.StringCallback,
      dynamic>((
    args,
    _,
  ) =>
      _i828.TextFieldDialogController(
        args,
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.singleton<_i1007.IProfileRepository>(() => _i241.ProfileRepository(
        gh<_i463.Flavor>(),
        gh<_i768.IHttpClient>(),
        gh<_i528.IAppLocalDatabase>(),
        gh<_i1037.ILoggerModule>(),
      ));
  gh.singleton<_i1069.IPostsRepository>(() => _i580.PostsRepository(
        gh<_i463.Flavor>(),
        gh<_i768.IHttpClient>(),
        gh<_i528.IAppLocalDatabase>(),
        gh<_i1037.ILoggerModule>(),
      ));
  gh.factoryParam<_i524.SubmitNewPasswordController,
      _i781.SubmitNewPasswordArguments, dynamic>((
    args,
    _,
  ) =>
      _i524.SubmitNewPasswordController(
        args,
        gh<_i762.IAuthRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.singleton<_i710.AuthController>(() => _i710.AuthController(
        gh<_i762.IAuthRepository>(),
        gh<_i1007.IProfileRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.factory<_i701.LoginController>(() => _i701.LoginController(
        gh<_i710.AuthController>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.singleton<_i251.IUtilsRepository>(() => _i1062.UtilsRepository(
        gh<_i463.Flavor>(),
        gh<_i768.IHttpClient>(),
        gh<_i528.IAppLocalDatabase>(),
        gh<_i1037.ILoggerModule>(),
      ));
  gh.singleton<_i26.AppController>(() => _i26.AppController(
        gh<_i463.Flavor>(),
        gh<_i710.AuthController>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.factory<_i656.RegisterController>(() => _i656.RegisterController(
        gh<_i710.AuthController>(),
        gh<_i762.IAuthRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.factoryParam<_i752.SubmitReceiverController,
      _i888.SubmitReceiverPageArguments, dynamic>((
    args,
    _,
  ) =>
      _i752.SubmitReceiverController(
        args,
        gh<_i762.IAuthRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  gh.factory<_i57.CreatePostController>(() => _i57.CreatePostController(
        gh<_i1069.IPostsRepository>(),
        gh<_i1037.ILoggerModule>(),
        gh<_i658.AppRouter>(),
        gh<_i573.SnakeBarShower>(),
      ));
  return getIt;
}

class _$AppRouterModule extends _i658.AppRouterModule {}

class _$ConnectivityPackage extends _i235.ConnectivityPackage {
  @override
  _i895.Connectivity get connectivity => _i895.Connectivity();
}
