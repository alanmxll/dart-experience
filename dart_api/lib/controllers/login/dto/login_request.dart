import 'package:dart_api/dart_api.dart';

class LoginRequest extends Serializable {
  String login;
  String password;

  @override
  Map<String, dynamic> asMap() {
    return {'login': login, 'password': password};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    password = object['password'] as String;
  }

  Map<String, String> validate() {
    final Map<String, String> validadeResult = {};

    if (login == null || login.isEmpty) {
      validadeResult['login'] = 'Login is required.';
    }

    if (password == null || password.isEmpty) {
      validadeResult['password'] = 'Password is required.';
    }

    return validadeResult;
  }
}
