import 'package:flag_frenzy/game/game_screen.dart';
import 'package:flag_frenzy/main.dart';
import 'package:flag_frenzy/screens/about_screen.dart';
import 'package:flag_frenzy/screens/leaderboard_screen.dart';
import 'package:flag_frenzy/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenu(),
    ),
    GoRoute(
      path: '/play',
      builder: (context, state) => const GameScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (context, state) => const LeaderboardScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
); 