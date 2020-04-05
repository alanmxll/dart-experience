import 'package:dart_api/dart_api.dart';
import 'package:dart_api/model/user_model.dart';
import 'package:dart_api/model/category_model.dart';

class MovementModel extends ManagedObject<_MovementModel>
    implements _MovementModel {}

@Table(name: 'movement')
class _MovementModel {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  DateTime movementDate;

  @Relate(#movements)
  UserModel user;

  @Relate(#movements)
  CategoryModel category;
}
