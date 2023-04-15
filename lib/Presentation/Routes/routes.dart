import '../../App/auth_service.dart';
import '../Pages/Confirm/confirm_viewpage.dart';
import '../Pages/Home/home_viewpage.dart';
import '../../Presentation/DependencyInjection/getit.dart';
import 'package:go_router/go_router.dart';

import '../Pages/Photo/photo_viewpage.dart';
import '../Views/Home/home_viewmodel.dart';

final routes = GoRouter(
    initialLocation: '/home',
    refreshListenable: getIt<AuthService>(),
    redirect: (context, state) {
      final isAuthenticated = getIt<AuthService>().isAuthenticated;
      final isLoginRoute = state.subloc == '/login';

      if (!isAuthenticated) {
        return isLoginRoute ? null : '/login';
      }

      if (isLoginRoute) return '/';
      return null;
    },
    routes: [
      GoRoute(
          path: '/home',
          builder: (context, state) {
            return getIt.get<HomeViewPage>();
          }),
      GoRoute(
          path: '/photo',
          builder: (context, state) {
            return getIt.get<PhotoViewPage>();
          }),
      GoRoute(
          path: '/confirm',
          builder: (context, state) {
            return getIt.get<ConfirmViewPage>();
          }),
    ]);
