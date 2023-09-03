import 'package:go_router/go_router.dart';
import 'package:waspha/src/features/navigation/navigation.dart';
import 'package:waspha/src/features/register/presentation/register.dart';
import 'package:waspha/src/features/resetPass/presentation/reset_pass.dart';
import 'package:waspha/src/features/verification/presentation/verification.dart';

import '../features/category/presentation/category.dart';
import '../features/get_location/presentation/get_location_map.dart';
import '../features/login/presentation/login.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Navigation(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/get-location/:lat/:lng',
      name: 'Get Location Map',
      builder: (context, state) => GetLocationMapScreen(
        userLat: double.parse(state.pathParameters['lat']!),
        userLng: double.parse(state.pathParameters['lng']!),
      ),
    ),
    GoRoute(
      path: '/verify',
      name: "Verification OTP",
      builder: (context, state) {
        return VerificationScreen(
          fullNumber: state.extra,
        );
      },
    ),
  ],
);
