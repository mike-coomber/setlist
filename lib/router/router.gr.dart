// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i13;
import 'package:setlist/core/domain/entities/band.dart' as _i12;
import 'package:setlist/features/auth/presentation/pages/logged_out_page.dart'
    as _i7;
import 'package:setlist/features/auth/presentation/pages/login_page.dart'
    as _i8;
import 'package:setlist/features/auth/presentation/pages/sign_up_page.dart'
    as _i9;
import 'package:setlist/features/band_details/presentation/pages/add_members_page.dart'
    as _i1;
import 'package:setlist/features/band_details/presentation/pages/band_dashboard_page.dart'
    as _i2;
import 'package:setlist/features/band_details/presentation/pages/band_details_page.dart'
    as _i3;
import 'package:setlist/features/create_band/presentation/pages/create_band_page.dart'
    as _i4;
import 'package:setlist/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i5;
import 'package:setlist/features/dashboard/presentation/pages/home_page.dart'
    as _i6;
import 'package:setlist/features/songs/presentation/pages/song_list_page.dart'
    as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AddMembersRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddMembersPage(),
      );
    },
    BandDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<BandDashboardRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BandDashboardPage(
          band: args.band,
          key: args.key,
        ),
      );
    },
    BandDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BandDetailsRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BandDetailsPage(
          band: args.band,
          key: args.key,
        ),
      );
    },
    CreateBandRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateBandPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    LoggedOutRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoggedOutPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SignUpPage(),
      );
    },
    SongListRoute.name: (routeData) {
      final args = routeData.argsAs<SongListRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SongListPage(
          band: args.band,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMembersPage]
class AddMembersRoute extends _i11.PageRouteInfo<void> {
  const AddMembersRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AddMembersRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMembersRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BandDashboardPage]
class BandDashboardRoute extends _i11.PageRouteInfo<BandDashboardRouteArgs> {
  BandDashboardRoute({
    required _i12.Band band,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BandDashboardRoute.name,
          args: BandDashboardRouteArgs(
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BandDashboardRoute';

  static const _i11.PageInfo<BandDashboardRouteArgs> page =
      _i11.PageInfo<BandDashboardRouteArgs>(name);
}

class BandDashboardRouteArgs {
  const BandDashboardRouteArgs({
    required this.band,
    this.key,
  });

  final _i12.Band band;

  final _i13.Key? key;

  @override
  String toString() {
    return 'BandDashboardRouteArgs{band: $band, key: $key}';
  }
}

/// generated route for
/// [_i3.BandDetailsPage]
class BandDetailsRoute extends _i11.PageRouteInfo<BandDetailsRouteArgs> {
  BandDetailsRoute({
    required _i12.Band band,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BandDetailsRoute.name,
          args: BandDetailsRouteArgs(
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BandDetailsRoute';

  static const _i11.PageInfo<BandDetailsRouteArgs> page =
      _i11.PageInfo<BandDetailsRouteArgs>(name);
}

class BandDetailsRouteArgs {
  const BandDetailsRouteArgs({
    required this.band,
    this.key,
  });

  final _i12.Band band;

  final _i13.Key? key;

  @override
  String toString() {
    return 'BandDetailsRouteArgs{band: $band, key: $key}';
  }
}

/// generated route for
/// [_i4.CreateBandPage]
class CreateBandRoute extends _i11.PageRouteInfo<void> {
  const CreateBandRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreateBandRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateBandRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoggedOutPage]
class LoggedOutRoute extends _i11.PageRouteInfo<void> {
  const LoggedOutRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoggedOutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedOutRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SongListPage]
class SongListRoute extends _i11.PageRouteInfo<SongListRouteArgs> {
  SongListRoute({
    required _i12.Band band,
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SongListRoute.name,
          args: SongListRouteArgs(
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SongListRoute';

  static const _i11.PageInfo<SongListRouteArgs> page =
      _i11.PageInfo<SongListRouteArgs>(name);
}

class SongListRouteArgs {
  const SongListRouteArgs({
    required this.band,
    this.key,
  });

  final _i12.Band band;

  final _i13.Key? key;

  @override
  String toString() {
    return 'SongListRouteArgs{band: $band, key: $key}';
  }
}
