import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/activity/offers/presentation/offers.dart';
import 'package:waspha/src/features/activity/presentation/activity.dart';
import 'package:waspha/src/features/buffer_brand/presentation/buffer_brand.dart';
import 'package:waspha/src/features/forget_password/forget_password.dart';
import 'package:waspha/src/features/forget_password/viewmodel.dart';
import 'package:waspha/src/features/forget_password_otp/forget_password_otp.dart';
import 'package:waspha/src/features/likes/data/likes_data.dart';
import 'package:waspha/src/features/likes/presentation/choose_location.dart';
import 'package:waspha/src/features/likes/presentation/screens/contact_list_screen/contact_list.dart';
import 'package:waspha/src/features/menu/menu_detail/presentation/menu_reviews.dart';
import 'package:waspha/src/features/menu/presentation/menu.dart';
import 'package:waspha/src/features/navigation/navigation.dart';
import 'package:waspha/src/features/nearby_stores/domain/stores_repository.dart';
import 'package:waspha/src/features/nearby_stores/presentation/nearby_stores.dart';
import 'package:waspha/src/features/notification/presentation/notification.dart';
import 'package:waspha/src/features/pass_reset/pass_reset.dart';
import 'package:waspha/src/features/profile/presentation/legal.dart';
import 'package:waspha/src/features/profile/presentation/pending_task.dart';
import 'package:waspha/src/features/profile/presentation/pickup_radius.dart';
import 'package:waspha/src/features/profile/presentation/privacy.dart';
import 'package:waspha/src/features/profile/presentation/settings.dart';
import 'package:waspha/src/features/profile/presentation/update_profile.dart';
import 'package:waspha/src/features/register/presentation/register.dart';
import 'package:waspha/src/features/resetPass/presentation/reset_pass.dart';
import 'package:waspha/src/features/reviews/presentation/reviews.dart';
import '../features/category/presentation/category.dart';
import '../features/creditcard/presentation/add_credit.dart';
import '../features/creditcard/presentation/creditcard.dart';
import '../features/creditcard/presentation/creditdetails.dart';
import '../features/custom_need/presentation/screens/custom_need_screen/custom_need.dart';
import '../features/custom_need/presentation/select_date.dart';
import '../features/get_location/presentation/get_location_map.dart';
import '../features/likes/presentation/add_address.dart';
import '../features/likes/presentation/edit_location.dart';
import '../features/likes/presentation/likes_screen.dart';
import '../features/login/presentation/login.dart';
import '../features/menu/menu_detail/presentation/menu_detail.dart';
import '../features/menu/menu_offer/presentation/menu_offer.dart';
import '../features/menu/menu_offer/presentation/subCategoryOffer.dart';
import '../features/menu/products/presentation/products_detail.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/profile/presentation/change_location.dart';
import '../features/profile/presentation/copyright_policy.dart';
import '../features/profile/presentation/edit_profile.dart';
import '../features/profile/presentation/faq.dart';
import '../features/profile/presentation/guest.dart';
import '../features/profile/presentation/profile.dart';
import '../features/profile/presentation/terms.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
// GoRouter configuration
final router = Provider<GoRouter>(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return CustomNavigation(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAKey,
              routes: [
                GoRoute(
                  path: '/',
                  redirect: (context, state) {
                    if (state.path == "/") {
                      debugPrint('The New Path Is ${state.path}');
                      isNearbyStoreScreenActive.value = true;
                    } else {
                      debugPrint('The New Path Is ${state.path}');
                      isNearbyStoreScreenActive.value = false;
                    }
                    return null;
                  },
                  builder: (context, state) {
                    isNearbyStoreScreenActive.value = true;
                    debugPrint('Inside PageBuilder');
                    return const NearbyStoreScreen();
                  },
                  onExit: (context) {
                    debugPrint('Exiting from Near By Stores');
                    isNearbyStoreScreenActive.value = false;
                    return true; // or false based on your conditions
                  },
                  routes: [
                    GoRoute(
                      parentNavigatorKey: rootNavigatorKey,
                      path: 'guest_screen',
                      builder: (context, state) => GuestScreen(),
                    ),
                    // child route
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorBKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/activity',
                  builder: (context, state) => const Activity(),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorCKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/likes',
                  builder: (context, state) => const LikesScreen(),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorDKey,
              routes: [
                // top route inside branch
                GoRoute(
                  path: '/credit',
                  builder: (context, state) => const CreditCardScreen(),
                  routes: [
                    // child route
                  ],
                ),
              ],
            ),
          ]),
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
        parentNavigatorKey: rootNavigatorKey,
        path: '/menu-screen',
        builder: (context, state) => MenuScreen(data: state.extra),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/menu-detail',
        builder: (context, state) {
          int sample = state.extra! as int;
          return MenuDetailScreen(
            id: sample,
          );
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
        path: '/custom_need_screen',
        builder: (context, state) => CustomNeedScreen(isMenu: state.extra! as bool),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/select_date',
        builder: (context, state) => SelectDateScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/product_details',
        builder: (context, state) => ProductDetails(data: state.extra!),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/subcategory_offer',
        builder: (context, state) => SubCategoryOffer(data: state.extra!),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/buffer_brand',
        builder: (context, state) {
          int s = state.extra as int;
          return BufferBrand(rfpID: s);
        },
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/activity_offers',
        builder: (context, state) => ActivityOffers(),
      ),
      GoRoute(
          parentNavigatorKey: rootNavigatorKey,
          path: '/profile',
          builder: (context, state) => ProfileScreen(),
          routes: []),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/credit_detail',
        builder: (context, state) => CreditDetails(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/edit_profile',
        builder: (context, state) => EditProfile(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/legal',
        builder: (context, state) => LegalScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/settings_screen',
        builder: (context, state) => SettingsScreen(),
      ),
      GoRoute(
        path: '/pending_screen',
        builder: (context, state) => PendingTasksScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/update_profile',
        builder: (context, state) => UpdateProfile(
          data: state.extra,
        ),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/notifications',
        builder: (context, state) => NotificationsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/reviews_screen',
        builder: (context, state) => ReviewsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/menu_reviews',
        builder: (context, state) => MenuReviews(id: state.extra),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/update_gender',
        builder: (context, state) => UpdateGender(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/update_dob',
        builder: (context, state) => UpdateDOB(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/terms',
        builder: (context, state) => TermsScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/privacy',
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/copyright_policy',
        builder: (context, state) => CopyRightPolicyScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/faq_screen',
        builder: (context, state) => FAQScreen(),
      ),
      GoRoute(
          path: '/forget_pass', builder: (context, state) => ForgetPassword()),
      GoRoute(
        path: '/forget_pass_otp',
        builder: (context, state) => ForgetPasswordOtp(
          passResetModel: state.extra as PasswordResetModel,
        ),
      ),
      GoRoute(
        path: '/reset_pass',
        builder: (context, state) =>
            ResetPassword(followUpCode: state.extra as String),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/change_location',
        builder: (context, state) => ChangeLocationScreen(),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/pickup_radius',
        builder: (context, state) => PickupRadius(),
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
          builder: (context, state) {
            DataLocation locationModel =
                state.extra as DataLocation; // 👈 casting is important
            return EditAddressScreen(locationModel: locationModel);
          }),
      GoRoute(
        path: '/contacts',
        builder: (context, state) => ContactList(),
      ),
    ],
  ),
);
