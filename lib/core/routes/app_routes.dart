import 'package:flutter/material.dart';
import '../../features/player/presentation/screen/add_player_screen.dart';
import '../../features/player/presentation/screen/extend_time_screen.dart';
import '../../features/player/presentation/screen/player_management_screen.dart';
import '../presentation/screen/home_layout_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, Widget Function(BuildContext)> routes = {
    ViewRoute.home.routeName: (_) => const HomeLayoutScreen(),
    ViewRoute.addPlayer.routeName: (_) => const AddPlayerScreen(),
    ViewRoute.playerManagement.routeName: (context) {
      final playerId = ModalRoute.of(context)?.settings.arguments as int;
      return PlayerManagementScreen(playerId);
    },
    ViewRoute.extendTime.routeName: (context) {
      final playerId = ModalRoute.of(context)?.settings.arguments as int;
      return ExtendTimeScreen(playerId);
    },
  };
}

enum ViewRoute {
  home('/'),
  playersList('/playersList'),
  playerManagement('/playerManagement'),
  extendTime('/extendTime'),
  nextPlayers('/nextPlayers'),
  dailyReport('/dailyReport'),
  settings('/settings'),
  addPlayer('/appPlayer');

  const ViewRoute(this.routeName);
  final String routeName;
}
