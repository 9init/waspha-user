import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:waspha/src/features/login/model/login/login_data.dart';
import 'package:waspha/src/features/login/model/social_token_data.dart';
import 'package:waspha/src/features/login/model/token_type.dart';
import 'package:waspha/src/features/profile/data/user_data.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

part 'login_domain.g.dart';

final accessTokenProvider = StateProvider<String>((ref) {
  return "";
});

@riverpod
Future sendLog(Ref ref,
    {required String mobile,
    required String password,
    required BuildContext context,
    required bool keepLogin}) async {
  final url = "/login";
  final result = await Networking.post(url, {
    "user_id": mobile,
    "password": password,
    "keepLogin": keepLogin.toString(),
  });

  final response = switch (result) {
    Success(value: final value) => value.data,
    Failure() => null,
    Error() => null
  };

  if (response == null) {
    debugPrint("LOGIN ERROR");
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(response["message"]),
  ));
  context.go('/');
}

@riverpod
Future singInWithGoogle(Ref ref, {required BuildContext context}) async {
  print("gUser");
  GoogleSignInAccount? gUser;
  try {
    gUser = await GoogleSignIn().signIn();
  } catch (e) {}
  if (gUser == null) return;

  // obtain auth details from request
  final GoogleSignInAuthentication gAuth = await gUser.authentication;

  final tokenData = SocialTokenData(
    tokenType: TokenType.google,
    token: gAuth.idToken!,
  );

  final UserData? result = await _invokeSocialLoginRequest(tokenData);
  if (result != null) context.go('/');
}

@riverpod
Future singInWithApple(Ref ref, {required BuildContext context}) async {
  final appleIdCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ],
  );

  final oAuthProvider = OAuthProvider('apple.com');
  final credential = oAuthProvider.credential(
    idToken: appleIdCredential.identityToken,
    accessToken: appleIdCredential.authorizationCode,
  );

  final userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  final splittedName = userCredential.user?.displayName?.split(' ');
  final givenName = splittedName?[0];
  final familyName =
      splittedName != null && splittedName.length >= 2 ? splittedName[1] : null;

  final tokenData = SocialTokenData(
    tokenType: TokenType.apple,
    token: appleIdCredential.authorizationCode,
    appleData: {
      'email': appleIdCredential.email ?? userCredential.user?.email,
      'given_name': appleIdCredential.givenName ?? givenName,
      'family_name': appleIdCredential.familyName ?? familyName,
    },
  );

  final UserData? result = await _invokeSocialLoginRequest(tokenData);
  if (result != null) context.go('/');
}

Future<UserData?> _invokeSocialLoginRequest(SocialTokenData tokenData) async {
  final url = "/social-login";
  final result = await Networking.post(url, {
    "token": tokenData.token,
    "token_type": tokenData.tokenType.name,
    "apple_data": tokenData.appleData
  });

  return switch (result) {
    Success(value: final v) => () {
        final loginData = UserData.fromJson(v.data["data"]);
        print(loginData);
        return loginData;
      }(),
    Failure() => null,
    Error() => null,
  };
}

@riverpod
Future<String?> getUserAvatar(Ref ref) async {
  final url = '/profile';
  final result = await Networking.get(url);

  return switch (result) {
    Success(value: final value) => value.data["data"]["avatar"],
    Failure() => null,
    Error() => null,
  };
}

@riverpod
Future<bool> isLoggedIn(Ref ref) async {
  final url = '/profile';
  final result = await Networking.get(url);

  return switch (result) {
    Success() => true,
    Failure() => false,
    Error() => false,
  };
}
