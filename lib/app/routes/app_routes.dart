import 'package:go_router/go_router.dart';
import 'package:smart_home/app/feature/auth/domain/user_entity.dart';
import 'package:smart_home/app/feature/auth/presentation/login_page.dart';
import 'package:smart_home/app/feature/home/domain/home_entity.dart';
import 'package:smart_home/app/feature/home/presentation/home_page.dart';
import 'package:smart_home/app/feature/room/presentation/summary_room_page.dart';

import '../feature/auth/presentation/splash_page.dart';

final routes = [
  GoRoute(path: "/login_page", builder: (context, state) => const LoginPage()),
  GoRoute(path: "/splash_page", builder: (context, state) => SplashPage()),
  GoRoute(path: "/home_page", builder: (context, state) => const HomePage()),
  GoRoute(path: "/summary_room_page", builder: (context, state) => SummaryRoomPage(homeEntity: state.extra as HomeEntity,)),
];
