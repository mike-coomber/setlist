import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setlist/injection_container.dart';
import 'package:setlist/router/debug_observer.dart';
import 'features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'firebase_options.dart';
import 'router/router.dart';

typedef AppBuilder = Future<Widget> Function();

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  init();
  final authCubit = serviceLocator<AuthCubit>();
  final router = AppRouter(authCubit: authCubit);

  runApp(App(
    authCubit: authCubit,
    router: router,
  ));
}

void main() {
  bootstrap();
}

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authCubit,
    required this.router,
  });

  final AppRouter router;
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => authCubit,
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'setlist',
          theme: ThemeData.light(useMaterial3: true),
          routerConfig: router.config(
            navigatorObservers: () => [DebugObserver()],
          ),
        );
      }),
    );
  }
}
