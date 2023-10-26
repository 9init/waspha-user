import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final googleServiceProvider = Provider(GoogleService.new);
final appleServiceProvider = Provider(AppleService.new);

class GoogleService {
  Ref ref;
  GoogleService(this.ref) : super();

  GoogleSignIn _googleSignIn = GoogleSignIn(
      serverClientId:
          '513965221116-eqtfbitbnq2s9pt70pn0vlcf5rgl6620.apps.googleusercontent.com');

  Future<GoogleSignInAuthentication?> signIn(context) async {
    GoogleSignInAccount? user = await _googleSignIn.signIn();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Sign in ${user?.displayName}'),
    ));

    return user?.authentication;
  }

  Future<GoogleSignInAccount?> signOut() async {
    return await _googleSignIn.signOut();
  }

  Future<GoogleSignInAccount?> currentUser() async {
    return await _googleSignIn.currentUser;
  }
}

class AppleService {
  Ref ref;
  AppleService(this.ref) : super();
  Future<AuthorizationCredentialAppleID?> signIn() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      webAuthenticationOptions:
          WebAuthenticationOptions(clientId: '', redirectUri: Uri.parse('')),
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print(credential);
    return credential;
  }
}
