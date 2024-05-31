import 'package:auto_route/auto_route.dart';
import 'package:setlist/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:setlist/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthCubit authCubit;

  AuthGuard({required this.authCubit});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authCubit.authenticated) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
