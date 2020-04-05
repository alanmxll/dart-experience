import 'package:dart_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_api/services/user_service.dart';

import '../../dart_api.dart';

class UserController extends ResourceController {
  UserController(this.context) : userService = UserService(context);

  final ManagedContext context;
  final UserService userService;

  @Operation.post()
  Future<Response> save(@Bind.body() RegisterUserRequest request) async {
    final validate = request.validate();

    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }

    try {
      await userService.saveUser(request);
      return Response.ok({'message': 'User successfully registered.'});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'Error saving the user.',
        'exception': e.toString()
      });
    }
  }
}
