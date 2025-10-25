import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/bottom_navigation_bar/presentation/controller/bottom_nav_controller.dart';
import '../../features/player/presentation/screen/add_player_screen.dart';
import '../presentation/screen/home_layout_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, Widget Function(BuildContext)> routes = {
    ViewRoute.home.routeName: (_) => BlocProvider(
      create: (context) => BottomNavCubit(),
      child: const HomeLayoutScreen(),
    ),
    ViewRoute.addPlayer.routeName: (_) => const AddPlayerScreen(),
  };
}

enum ViewRoute {
  home('/'),
  playersList('/playersList'),
  playerControl('/playerControl'),
  extendTime('/extendTime'),
  nextPlayers('/nextPlayers'),
  dailyReport('/dailyReport'),
  settings('/settings'),
  addPlayer('/appPlayer');

  const ViewRoute(this.routeName);
  final String routeName;
}
