import 'package:auto_route/auto_route.dart';
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

  runApp(const App());
}

void main() {
  bootstrap();
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => serviceLocator<AuthCubit>(),
      child: Builder(builder: (context) {
        final appRouter = AppRouter(authCubit: context.read<AuthCubit>());

        return MaterialApp.router(
          title: 'setlist',
          theme: ThemeData.light(useMaterial3: true),
          routerConfig: appRouter.config(
            navigatorObservers: () => [DebugObserver()],
            reevaluateListenable: ReevaluateListenable.stream(
              context.read<AuthCubit>().stream,
            ),
          ),
        );
      }),
    );
  }
}
