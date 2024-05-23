import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/router/debug_observer.dart';
import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/entities/auth_user.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/current_user_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'firebase_options.dart';
import 'router/router.dart';

typedef AppBuilder = Future<Widget> Function();

Future<void> bootstrap(AppBuilder builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(await builder());
}

void main() {
  bootstrap(
    () async {
      AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSourceImpl();

      AuthRepository authRepository = AuthRepositoryImpl(
        authRemoteDataSource: authRemoteDataSource,
      );

      return App(
        authRepository: authRepository,
        authUser: await authRepository.user.first,
      );
    },
  );
}

class App extends StatelessWidget {
  App({
    super.key,
    required this.authRepository,
    this.authUser,
  });

  final AuthRepository authRepository;
  final AuthUser? authUser;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
      ],
      child: BlocProvider(
        create: (context) {
          return AuthCubit(
            currentUserUsecase: CurrentUserUsecase(
              authRepository: context.read<AuthRepository>(),
            ),
            logoutUsecase: LogoutUsecase(
              authRepository: context.read<AuthRepository>(),
            ),
          );
        },
        child: Builder(builder: (context) {
          final appRouter = AppRouter(authCubit: context.read<AuthCubit>());
          final stream = context.read<AuthCubit>().stream;
          stream.listen((_) {
            print('changed');
          });
          return MaterialApp.router(
            title: 'Clean Architecture',
            theme: ThemeData.light(useMaterial3: true),
            routerConfig: appRouter.config(
              navigatorObservers: () => [DebugObserver()],
              reevaluateListenable: ReevaluateListenable.stream(
                stream,
              ),
            ),
          );
        }),
      ),
    );
  }
}
