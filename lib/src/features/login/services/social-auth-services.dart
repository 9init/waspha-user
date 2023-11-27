import 'package:google_sign_in/google_sign_in.dart';
import 'package:waspha/src/features/login/model/social_token_data.dart';
import 'package:waspha/src/features/login/model/token_type.dart';

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
}
