import 'package:auto_route/auto_route.dart';
import 'package:setlist/router/guards/auth_guard.dart';

import '../features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  final AuthCubit authCubit;

  AppRouter({super.navigatorKey, required this.authCubit});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashboardRoute.page,
          path: '/',
          guards: [
            AuthGuard(authCubit: authCubit),
          ],
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: CreateBandRoute.page),
            AutoRoute(
              page: BandDetailsRoute.page,
              children: [
                AutoRoute(
                  page: BandDashboardRoute.page,
                  initial: true,
                ),
                AutoRoute(page: AddMembersRoute.page),
              ],
            )
          ],
          initial: true,
          keepHistory: false,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: LoggedOutRoute.page),
        AutoRoute(page: SignUpRoute.page),
      ];
}
