import 'package:dart_api/controllers/login/dto/login_request.dart';
import 'package:dart_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_api/dart_api.dart';
import 'package:dart_api/model/user_model.dart';
import 'package:dart_api/repository/user_repository.dart';
import 'package:dart_api/utils/cryptography_utils.dart';
import 'package:dart_api/utils/jwt_utils.dart';

class UserService {
  UserService(this.context) : userRepository = UserRepository(context);

  final ManagedContext context;
  final UserRepository userRepository;

  Future<String> login(LoginRequest request) async {
    final String login = request.login;
    final String password = request.password;
    final String encryptedPassword =
        CryptographyUtils.encryptPassword(password);

    final user = await userRepository.recoveryUserByLoginAndPassword(
        login, encryptedPassword);

    if (user != null) {
      return JwtUtils.generateTokenJWT(user);
    }

    return null;
  }

  Future<void> saveUser(RegisterUserRequest request) async {
    await userRepository.saveUser(request);
  }

  Future<UserModel> searchById(int id) async {
    return await userRepository.searchById(id);
  }
}
