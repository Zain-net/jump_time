import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_player/presentation/screen/add_player_screen.dart';
import '../../features/bottom_navigation_bar/presentation/controller/bottom_nav_controller.dart';
import '../../features/players_list/presentation/screen/players_list_screen.dart';
import '../presentation/screen/home_layout_screen.dart';

class Routes {
  Routes._();

  static const home = '/';
  static const playersList = '/playersList';
  static const playerControl = '/playerControl';
  static const extendTime = '/extendTime';
  static const nextPlayers = '/nextPlayers';
  static const dailyReport = '/dailyReport';
  static const settings = '/settings';
  static const addPlayer = '/appPlayer';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => BlocProvider(
      create: (context) => BottomNavCubit(),
      child: const HomeLayoutScreen(),
    ),
    playersList: (_) => const PlayersListScreen(),
    addPlayer: (_) => const AddPlayerScreen(),
    
  };
}
