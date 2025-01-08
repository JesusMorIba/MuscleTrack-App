import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:muscle_track/core/provider/provider.dart';
import 'package:muscle_track/features/complete_profile/presentation/ui/complete_profile_screen.dart';
import 'package:muscle_track/features/home/presentation/ui/home_screen.dart';
import 'package:muscle_track/features/signup/presentation/ui/signup_screen.dart';
import 'package:muscle_track/features/walk_through/presentation/ui/walk_through_screen.dart';
import 'package:muscle_track/features/login/presentation/ui/login_screen.dart';

import 'app_router_const.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isGoingToLogin = state.matchedLocation == '/login';

      if (authState) {
        if (isGoingToLogin) {
          return '/home';
        }
      }

      return '/home';
    },
    routes: [
      GoRoute(
        path: '/login',
        name: loginRoute,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: singupRoute,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/home',
        name: homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/complete_profile',
        name: completeProfileRoute,
        builder: (context, state) => const CompleteProfileScreen(),
      ),
      GoRoute(
        path: '/walkthrough',
        name: walkThroughRoute,
        builder: (context, state) => const WalkThroughScreen(),
      ),
    ],
  );
});
