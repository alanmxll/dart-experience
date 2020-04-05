import 'package:dart_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_api/dart_api.dart';
import 'package:dart_api/model/user_model.dart';
import 'package:dart_api/utils/cryptography_utils.dart';

class UserRepository {
  UserRepository(this.context);

  final ManagedContext context;

  Future<UserModel> recoveryUserByLoginAndPassword(
      String login, String password) {
    final query = Query<UserModel>(context)
      ..where((users) => users.login).equalTo(login)
      ..where((users) => users.password).equalTo(password);

    return query.fetchOne();
  }

  Future<void> saveUser(RegisterUserRequest request) async {
    final userSave = UserModel()..read(request.asMap());
    userSave.password = CryptographyUtils.encryptPassword(request.password);

    await context.insertObject(userSave);
  }

  Future<UserModel> searchById(int id) async {
    final query = Query<UserModel>(context)
      ..where((users) => users.id).equalTo(id);

    return await query.fetchOne();
  }
}
