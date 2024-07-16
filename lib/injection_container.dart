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
import 'package:setlist/core/data/datasources/band_remote_data_source.dart';
import 'package:setlist/core/data/datasources/membership_remote_data_source.dart';
import 'package:setlist/core/data/datasources/musician_remote_data_source.dart';
import 'package:setlist/core/data/repositories/band_repository_impl.dart';
import 'package:setlist/core/data/repositories/membership_respository_impl.dart';
import 'package:setlist/core/data/repositories/musician_repository_impl.dart';
import 'package:setlist/core/domain/repositories/band_repository.dart';
import 'package:setlist/core/domain/repositories/membership_repository.dart';
import 'package:setlist/core/domain/repositories/musician_repository.dart';
import 'package:setlist/features/band_details/presentation/cubit/add_members/add_members_cubit.dart';
import 'package:setlist/features/band_details/presentation/cubit/band_details/band_details_cubit.dart';
import 'package:setlist/features/band_details/usecases/add_members_usecase.dart';
import 'package:setlist/features/band_details/usecases/delete_band_usecase.dart';
import 'package:setlist/features/band_details/usecases/search_musicians_usecase.dart';
import 'package:setlist/features/create_band/usecases/create_band_usecase.dart';
import 'package:setlist/features/dashboard/usecases/create_musician_usecase.dart';
import 'package:setlist/features/band_details/usecases/get_band_members_usecase.dart';
import 'package:setlist/features/dashboard/usecases/get_bands_usecase.dart';
import 'package:setlist/features/dashboard/usecases/get_musician_usecase.dart';
import 'package:setlist/features/dashboard/usecases/membership_notifier_usecase.dart';
import 'package:setlist/features/create_band/presentation/cubit/create_band_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/create_musician/create_musician_cubit.dart';
import 'package:setlist/features/dashboard/presentation/cubit/dashboard/dashboard_cubit.dart';

import 'core/domain/entities/band.dart';

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
      getBandsUsecase: serviceLocator(),
      membershipNotifierUsecase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CreateMusicianCubit(
      createMusicianUsecase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CreateBandCubit(
      createBandUsecase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactoryParam(
    (List<String> currentMemberMusicianIds, _) => AddMembersCubit(
      currentMemberMusicianIds: currentMemberMusicianIds,
      searchMusiciansUsecase: serviceLocator(),
      addMembersUsecase: serviceLocator(),
    ),
  );
  serviceLocator.registerFactoryParam(
    (Band band, _) => BandDetailsCubit(
      band: band,
      getBandMembersUsecase: serviceLocator(),
      deleteBandUsecase: serviceLocator(),
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
  serviceLocator.registerLazySingleton(
    () => CreateBandUsecase(
      bandRepository: serviceLocator(),
      membershipRepository: serviceLocator(),
      musicianRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetBandsUsecase(
      bandRepository: serviceLocator(),
      membershipRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => MembershipNotifierUsecase(
      membershipRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetBandMembersUsecase(
      musicianRepository: serviceLocator(),
      membershipRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => DeleteBandUsecase(
      bandRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => SearchMusiciansUsecase(
      musicianRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => AddMembersUsecase(
      membershipRepository: serviceLocator(),
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
  serviceLocator.registerLazySingleton<MembershipRepository>(
    () => MembershipRespositoryImpl(
      membershipRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BandRepository>(
    () => BandRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  // Data sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<MusicianRemoteDataSource>(
    () => MusicianRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<BandRemoteDataSource>(
    () => BandRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<MembershipRemoteDataSource>(
    () => MembershipRemoteDataSourceImpl(),
  );
}
