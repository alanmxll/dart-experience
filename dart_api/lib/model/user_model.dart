import '../dart_api.dart';
import './movement_model.dart';

class UserModel extends ManagedObject<_UserModel> implements _UserModel {}

@Table(name: "users")
class _UserModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(unique: true)
  String login;

  @Column()
  String password;

  ManagedSet<MovementModel> movements;
}
