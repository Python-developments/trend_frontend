import 'package:get_it/get_it.dart';

import '../../features/auth/data/data_sources/auth_data_source.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/base_auth_repositories.dart';
import '../../features/auth/domain/use_cases/login_use_case.dart';
import '../../features/auth/domain/use_cases/refresh_token_use_case.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/auth/domain/use_cases/resend_otp_use_case.dart';
import '../../features/auth/domain/use_cases/rest_password_Send_email_use_case.dart';
import '../../features/auth/domain/use_cases/rest_password_finish_use_case.dart';
import '../../features/auth/domain/use_cases/rest_password_verify_otp_use_case.dart';
import '../../features/auth/domain/use_cases/verify_otp_use_case.dart';
import '../../features/explore/data/data_sources/get_post_data_source.dart';
import '../../features/explore/data/repositories/explore_repository.dart';
import '../../features/explore/domain/repositories/get_post_base_repository.dart';
import '../../features/explore/domain/use_cases/for_you_use_case.dart';
import '../../features/explore/domain/use_cases/get_post_with_page_number_use_case.dart';
import '../../features/explore/domain/use_cases/get_posts_use_case.dart';
import '../../features/explore/domain/use_cases/hashtags_use_case.dart';
import '../../features/explore/domain/use_cases/location_search.dart';
import '../../features/explore/domain/use_cases/user_search_use_case.dart';
import '../../features/explore/presentation/manager/explore/explore_bloc.dart';
import '../../features/explore/presentation/manager/explore/explore_event.dart';


final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // this is for explore block injection
    sl.registerFactory(() => ExploreBloc(
        getPostsUseCase: sl(), getPostWithPageNumberUseCase: sl())
      ..add(GetAllPostsEvent()));

    // this is for data source injection
    sl.registerLazySingleton<BasePostDataSource>(
        () => PostDataSource());

    // this is for repository injection
    sl.registerLazySingleton<BaseExploreRepository>(
        () => ExploreRepository(
              basePostDataSource: sl(),
            ));

    // this is for use case injection
    sl.registerLazySingleton(
        () => GetPostsUseCase(baseGetPostRepository: sl()));
    sl.registerLazySingleton(
        () => ForYouSearchUseCase(baseGetPostRepository: sl()));
    sl.registerLazySingleton(
        () => HashtagsUseCase(baseGetPostRepository: sl()));
    sl.registerLazySingleton(() =>
        GetPostWithPageNumberUseCase(baseGetPostRepository: sl()));
    sl.registerLazySingleton(
        () => UserSearchUseCase(baseGetPostRepository: sl()));
    sl.registerLazySingleton(
        () => LocationSearchUseCase(baseGetPostRepository: sl()));

    //////////////////////////////////////////////////////////////////

    // this is for auth
    
    // sl.registerFactory(() => AuthBloc(loginUseCase: sl(), registerUseCase: sl()));

    
    // this is for data source injection
    sl.registerLazySingleton<BaseAuthDataSource>(
        () => AuthDataSourceImpl());

    // this is for repository injection
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(
          baseAuthDataSource: sl(),
        ));

    // this is for use case injection
    sl.registerLazySingleton(
        () => LoginUseCase(authRepository: sl()));
    sl.registerLazySingleton(
        () => RegisterUseCase(authRepository: sl()));
    sl.registerLazySingleton(
        () => ResendOtpUseCase(authRepository: sl()));
    sl.registerLazySingleton(
        () => VerifyOtpUseCase(authRepository: sl()));
    
    
    sl.registerLazySingleton(
            () => RestPasswordSendEmailUseCase(authRepository: sl()));
    sl.registerLazySingleton(
            () => RestPasswordVerifyOtpUseCase(authRepository: sl())); 
    sl.registerLazySingleton(
            () => RestPasswordFinishUseCase(authRepository: sl()));
    // 
    sl.registerLazySingleton(
            () => RefreshTokenUseCase(authRepository: sl()));
    
  }
}
