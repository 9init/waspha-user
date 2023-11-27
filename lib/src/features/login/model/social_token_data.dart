import 'package:waspha/src/features/login/model/token_type.dart';

class SocialTokenData {
  final TokenType tokenType;
  final String token;

  SocialTokenData({
    required this.tokenType,
    required this.token,
  });
}
