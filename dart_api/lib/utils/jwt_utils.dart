import 'package:dart_api/model/user_model.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtUtils {
  static const String _jwtPrivateKey =
      'Cc4EDO7XvKBvYalFbS6-P2GhPhNqQDaHuZVAxrcXvXA';

  static String generateTokenJWT(UserModel user) {
    final claimSet = JwtClaim(
      issuer: 'http://localhost',
      subject: user.id.toString(),
      otherClaims: <String, dynamic>{},
      maxAge: const Duration(days: 1),
    );

    final token = 'Bearer ${issueJwtHS256(claimSet, _jwtPrivateKey)}';

    return token;
  }

  static JwtClaim checkToken(String token) {
    return verifyJwtHS256Signature(token, _jwtPrivateKey);
  }
}
