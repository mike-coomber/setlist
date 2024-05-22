import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/features/auth/presentation/pages/sign_up_page.dart';

import 'features/auth/data/datasources/auth_remote_data_source.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/entities/auth_user.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'firebase_options.dart';

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
  const App({
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
      child: MaterialApp(
        title: 'Clean Architecture',
        theme: ThemeData.light(useMaterial3: true),
        home: const SignUpPage(),
      ),
    );
  }
}
