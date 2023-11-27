import 'package:dio/src/dio_exception.dart';
import 'package:dio/src/response.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:waspha/src/features/login/model/login/login_data.dart';
import 'package:waspha/src/features/login/model/social_token_data.dart';
import 'package:waspha/src/features/login/model/token_type.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

class SocialAuthServices {
  Future<SocialTokenData?> singInWithGoogle() async {
    final GoogleSignInAccount? gUser =
        await GoogleSignIn(scopes: ['email']).signIn();

    if (gUser == null) return null;

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    return SocialTokenData(
      tokenType: TokenType.google,
      token: gAuth.idToken!,
    );
  }

  // TODO - Check this request
  Future<LoginData?> invokeRequest(SocialTokenData tokenData) async {
    final url = "/social-login";
    final result = await Networking.post(url, {
      "token": tokenData.token,
      "token_type": tokenData.tokenType.name,
    });

    return switch (result) {
      Success(value: final v) => LoginData.fromJson(v.data["data"]),
      Failure(failure: final f) => null,
      Error(exception: final e) => null,
    };
  }
}
