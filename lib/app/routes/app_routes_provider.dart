import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final routeProvider =
    Provider<GoRouter>((ref) => GoRouter(routes: routes, initialLocation: "/splash_page"));
