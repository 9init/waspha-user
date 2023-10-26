import 'package:go_router/go_router.dart';
import 'package:waspha/src/features/activity/offers/presentation/offers.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';
import 'package:waspha/src/features/buffer_brand/presentation/buffer_brand.dart';
import 'package:waspha/src/features/likes/presentation/choose_location.dart';
import 'package:waspha/src/features/menu/presentation/menu.dart';
import 'package:waspha/src/features/navigation/navigation.dart';
import 'package:waspha/src/features/notification/presentation/notification.dart';
import 'package:waspha/src/features/profile/presentation/legal.dart';
import 'package:waspha/src/features/profile/presentation/pending_task.dart';
import 'package:waspha/src/features/profile/presentation/privacy.dart';
import 'package:waspha/src/features/profile/presentation/settings.dart';
import 'package:waspha/src/features/profile/presentation/update_profile.dart';
import 'package:waspha/src/features/register/presentation/register.dart';
import 'package:waspha/src/features/resetPass/presentation/reset_pass.dart';
import 'package:waspha/src/features/reviews/presentation/reviews.dart';
import 'package:waspha/src/features/verification/presentation/verification.dart';

import '../features/category/presentation/category.dart';
import '../features/creditcard/presentation/add_credit.dart';
import '../features/creditcard/presentation/creditdetails.dart';
import '../features/custom_need/presentation/custom_need.dart';
import '../features/custom_need/presentation/select_date.dart';
import '../features/forget_password/presentation/forget_password.dart';
import '../features/get_location/presentation/get_location_map.dart';
import '../features/likes/presentation/add_address.dart';
import '../features/likes/presentation/edit_location.dart';
import '../features/login/presentation/login.dart';
import '../features/menu/menu_detail/presentation/menu_detail.dart';
import '../features/menu/menu_offer/presentation/menu_offer.dart';
import '../features/menu/products/presentation/products_detail.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/profile/presentation/change_location.dart';
import '../features/profile/presentation/copyright_policy.dart';
import '../features/profile/presentation/edit_profile.dart';
import '../features/profile/presentation/faq.dart';
import '../features/profile/presentation/guest.dart';
import '../features/profile/presentation/profile.dart';
import '../features/profile/presentation/terms.dart';

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
      path: '/menu-screen',
      builder: (context, state) => MenuScreen(data: state.extra),
    ),
    GoRoute(
      path: '/menu-detail',
      builder: (context, state) {
        int sample = state.extra! as int;
        return MenuDetailScreen(
          id: sample,
        );
      },
    ),
    GoRoute(
      path: '/menu-offer',
      builder: (context, state) {
        int sample = state.extra! as int;

        return MenuOffer(
          id: sample,
        );
      },
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
    GoRoute(
      path: '/custom_need_screen',
      builder: (context, state) => CustomNeedScreen(isMenu: state.extra!),
    ),
    GoRoute(
      path: '/select_date',
      builder: (context, state) => SelectDateScreen(),
    ),
    GoRoute(
      path: '/product_details',
      builder: (context, state) => ProductDetails(id: state.extra!),
    ),
    GoRoute(
      path: '/buffer_brand',
      builder: (context, state) => BufferBrand(),
    ),
    GoRoute(
      path: '/activity',
      builder: (context, state) => Activity(),
    ),
    GoRoute(
      path: '/activity_offers',
      builder: (context, state) => ActivityOffers(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/credit_detail',
      builder: (context, state) => CreditDetails(),
    ),
    GoRoute(
      path: '/edit_profile',
      builder: (context, state) => EditProfile(),
    ),
    GoRoute(
      path: '/legal',
      builder: (context, state) => LegalScreen(),
    ),
    GoRoute(
      path: '/settings_screen',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: '/pending_screen',
      builder: (context, state) => PendingTasksScreen(),
    ),
    GoRoute(
      path: '/guest_screen',
      builder: (context, state) => GuestScreen(),
    ),
    GoRoute(
      path: '/update_profile',
      builder: (context, state) => UpdateProfile(
        data: state.extra,
      ),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => NotificationsScreen(),
    ),
    GoRoute(
      path: '/reviews_screen',
      builder: (context, state) => ReviewsScreen(),
    ),
    GoRoute(
      path: '/update_gender',
      builder: (context, state) => UpdateGender(),
    ),
    GoRoute(
      path: '/update_dob',
      builder: (context, state) => UpdateDOB(),
    ),
    GoRoute(
      path: '/terms',
      builder: (context, state) => TermsScreen(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => PrivacyPolicyScreen(),
    ),
    GoRoute(
      path: '/copyright_policy',
      builder: (context, state) => CopyRightPolicyScreen(),
    ),
    GoRoute(
      path: '/faq_screen',
      builder: (context, state) => FAQScreen(),
    ),
    GoRoute(
      path: '/forget_password',
      builder: (context, state) => ForgetPasswordScreen(),
    ),
    GoRoute(
      path: '/change_location',
      builder: (context, state) => ChangeLocationScreen(),
    ),
    GoRoute(
      path: '/add_address',
      builder: (context, state) => AddAddressScreen(),
    ),
    GoRoute(
      path: '/choose_location',
      builder: (context, state) => ChooseLocation(),
    ),
    GoRoute(
      path: '/add_credit_card',
      builder: (context, state) => AddCreditCard(),
    ),
    GoRoute(
        path: '/edit_location',
        name: "EditLocation",
        builder: (context, state) => EditAddressScreen(
              title: state.pathParameters['title']!,
              address: state.pathParameters['address']!,
              landmark: state.pathParameters['landmark']!,
              phone: state.pathParameters['phone']!,
            )),
  ],
);
