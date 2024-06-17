import 'package:get_it/get_it.dart';
import 'package:setlist/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:setlist/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:setlist/features/auth/domain/repositories/auth_repository.dart';
import 'package:setlist/features/auth/domain/usecases/current_user_usecase.dart';
import 'package:setlist/features/auth/domain/usecases/login_usecase.dart';
import 'package:setlist/features/auth/domain/usecases/logout_usecase.dart';
import 'package:setlist/features/auth/domain/usecases/signup_usecase.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:setlist/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:setlist/features/dashboard/data/datasources/musician_remote_data_source.dart';
import 'package:setlist/features/dashboard/data/repositories/musician_repository_impl.dart';
import 'package:setlist/features/dashboard/domain/repositories/musician_repository.dart';
import 'package:setlist/features/dashboard/domain/usecases/create_musician_usecase.dart';
import 'package:setlist/features/dashboard/domain/usecases/get_musician_usecase.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';

final serviceLocator = GetIt.instance;

void init() {
  // Cubits
  serviceLocator.registerFactory(
    () => AuthCubit(
      currentUserUsecase: serviceLocator(),
      logoutUsecase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SignUpCubit(
      usecase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => LoginCubit(
      usecase: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => DashboardCubit(
      getMusicianUsecase: serviceLocator(),
      createMusicianUsecase: serviceLocator(),
    ),
  );

  // Usecases
  serviceLocator.registerLazySingleton(
    () => LoginUsecase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogoutUsecase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => SignupUsecase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CurrentUserUsecase(
      authRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetMusicianUsecase(
      musicianRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => CreateMusicianUsecase(
      musicianRepository: serviceLocator(),
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<MusicianRepository>(
    () => MusicianRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<MusicianRemoteDataSource>(
    () => MusicianRemoteDataSourceImpl(),
  );
}
