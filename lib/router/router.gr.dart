// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i16;
import 'package:setlist/core/domain/entities/band.dart' as _i15;
import 'package:setlist/features/auth/presentation/pages/logged_out_page.dart'
    as _i7;
import 'package:setlist/features/auth/presentation/pages/login_page.dart'
    as _i8;
import 'package:setlist/features/auth/presentation/pages/sign_up_page.dart'
    as _i12;
import 'package:setlist/features/band_details/domain/entities/song.dart'
    as _i18;
import 'package:setlist/features/band_details/presentation/pages/add_members_page.dart'
    as _i1;
import 'package:setlist/features/band_details/presentation/pages/band_dashboard_page.dart'
    as _i2;
import 'package:setlist/features/band_details/presentation/pages/band_details_page.dart'
    as _i3;
import 'package:setlist/features/band_details/presentation/pages/setlist_page.dart'
    as _i11;
import 'package:setlist/features/band_details/presentation/views/setlist_list_view.dart'
    as _i10;
import 'package:setlist/features/band_details/presentation/views/song_list_view.dart'
    as _i13;
import 'package:setlist/features/create_band/presentation/pages/create_band_page.dart'
    as _i4;
import 'package:setlist/features/dashboard/presentation/pages/dashboard_page.dart'
    as _i5;
import 'package:setlist/features/dashboard/presentation/pages/home_page.dart'
    as _i6;
import 'package:setlist/features/setlist_editor/domain/entities/setlist.dart'
    as _i17;
import 'package:setlist/features/setlist_editor/presentation/pages/setlist_editor_page.dart'
    as _i9;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddMembersRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddMembersPage(),
      );
    },
    BandDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<BandDashboardRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BandDashboardPage(
          band: args.band,
          key: args.key,
        ),
      );
    },
    BandDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<BandDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BandDetailsPage(
          band: args.band,
          key: args.key,
        ),
      );
    },
    CreateBandRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CreateBandPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    LoggedOutRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoggedOutPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    SetlistEditorRoute.name: (routeData) {
      final args = routeData.argsAs<SetlistEditorRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SetlistEditorPage(
          band: args.band,
          setlist: args.setlist,
          key: args.key,
        ),
      );
    },
    SetlistTab.name: (routeData) {
      final args = routeData.argsAs<SetlistTabArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.SetlistListView(
          setlists: args.setlists,
          band: args.band,
          key: args.key,
        ),
      );
    },
    SetlistRoute.name: (routeData) {
      final args = routeData.argsAs<SetlistRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SetlistPage(
          setlist: args.setlist,
          band: args.band,
          key: args.key,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SignUpPage(),
      );
    },
    SongTab.name: (routeData) {
      final args = routeData.argsAs<SongTabArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SongListView(
          songs: args.songs,
          onSongSelected: args.onSongSelected,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddMembersPage]
class AddMembersRoute extends _i14.PageRouteInfo<void> {
  const AddMembersRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddMembersRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddMembersRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BandDashboardPage]
class BandDashboardRoute extends _i14.PageRouteInfo<BandDashboardRouteArgs> {
  BandDashboardRoute({
    required _i15.Band band,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          BandDashboardRoute.name,
          args: BandDashboardRouteArgs(
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BandDashboardRoute';

  static const _i14.PageInfo<BandDashboardRouteArgs> page =
      _i14.PageInfo<BandDashboardRouteArgs>(name);
}

class BandDashboardRouteArgs {
  const BandDashboardRouteArgs({
    required this.band,
    this.key,
  });

  final _i15.Band band;

  final _i16.Key? key;

  @override
  String toString() {
    return 'BandDashboardRouteArgs{band: $band, key: $key}';
  }
}

/// generated route for
/// [_i3.BandDetailsPage]
class BandDetailsRoute extends _i14.PageRouteInfo<BandDetailsRouteArgs> {
  BandDetailsRoute({
    required _i15.Band band,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          BandDetailsRoute.name,
          args: BandDetailsRouteArgs(
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BandDetailsRoute';

  static const _i14.PageInfo<BandDetailsRouteArgs> page =
      _i14.PageInfo<BandDetailsRouteArgs>(name);
}

class BandDetailsRouteArgs {
  const BandDetailsRouteArgs({
    required this.band,
    this.key,
  });

  final _i15.Band band;

  final _i16.Key? key;

  @override
  String toString() {
    return 'BandDetailsRouteArgs{band: $band, key: $key}';
  }
}

/// generated route for
/// [_i4.CreateBandPage]
class CreateBandRoute extends _i14.PageRouteInfo<void> {
  const CreateBandRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateBandRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateBandRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoggedOutPage]
class LoggedOutRoute extends _i14.PageRouteInfo<void> {
  const LoggedOutRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoggedOutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoggedOutRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SetlistEditorPage]
class SetlistEditorRoute extends _i14.PageRouteInfo<SetlistEditorRouteArgs> {
  SetlistEditorRoute({
    required _i15.Band band,
    _i17.Setlist? setlist,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SetlistEditorRoute.name,
          args: SetlistEditorRouteArgs(
            band: band,
            setlist: setlist,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SetlistEditorRoute';

  static const _i14.PageInfo<SetlistEditorRouteArgs> page =
      _i14.PageInfo<SetlistEditorRouteArgs>(name);
}

class SetlistEditorRouteArgs {
  const SetlistEditorRouteArgs({
    required this.band,
    this.setlist,
    this.key,
  });

  final _i15.Band band;

  final _i17.Setlist? setlist;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SetlistEditorRouteArgs{band: $band, setlist: $setlist, key: $key}';
  }
}

/// generated route for
/// [_i10.SetlistListView]
class SetlistTab extends _i14.PageRouteInfo<SetlistTabArgs> {
  SetlistTab({
    required List<_i17.Setlist> setlists,
    required _i15.Band band,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SetlistTab.name,
          args: SetlistTabArgs(
            setlists: setlists,
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SetlistTab';

  static const _i14.PageInfo<SetlistTabArgs> page =
      _i14.PageInfo<SetlistTabArgs>(name);
}

class SetlistTabArgs {
  const SetlistTabArgs({
    required this.setlists,
    required this.band,
    this.key,
  });

  final List<_i17.Setlist> setlists;

  final _i15.Band band;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SetlistTabArgs{setlists: $setlists, band: $band, key: $key}';
  }
}

/// generated route for
/// [_i11.SetlistPage]
class SetlistRoute extends _i14.PageRouteInfo<SetlistRouteArgs> {
  SetlistRoute({
    required _i17.Setlist setlist,
    required _i15.Band band,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SetlistRoute.name,
          args: SetlistRouteArgs(
            setlist: setlist,
            band: band,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SetlistRoute';

  static const _i14.PageInfo<SetlistRouteArgs> page =
      _i14.PageInfo<SetlistRouteArgs>(name);
}

class SetlistRouteArgs {
  const SetlistRouteArgs({
    required this.setlist,
    required this.band,
    this.key,
  });

  final _i17.Setlist setlist;

  final _i15.Band band;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SetlistRouteArgs{setlist: $setlist, band: $band, key: $key}';
  }
}

/// generated route for
/// [_i12.SignUpPage]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SongListView]
class SongTab extends _i14.PageRouteInfo<SongTabArgs> {
  SongTab({
    required List<_i18.Song> songs,
    void Function(_i18.Song)? onSongSelected,
    _i16.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SongTab.name,
          args: SongTabArgs(
            songs: songs,
            onSongSelected: onSongSelected,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SongTab';

  static const _i14.PageInfo<SongTabArgs> page =
      _i14.PageInfo<SongTabArgs>(name);
}

class SongTabArgs {
  const SongTabArgs({
    required this.songs,
    this.onSongSelected,
    this.key,
  });

  final List<_i18.Song> songs;

  final void Function(_i18.Song)? onSongSelected;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SongTabArgs{songs: $songs, onSongSelected: $onSongSelected, key: $key}';
  }
}
