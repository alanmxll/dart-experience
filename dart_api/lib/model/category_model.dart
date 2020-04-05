import 'package:dart_api/dart_api.dart';
import './movement_model.dart';

class CategoryModel extends ManagedObject<_CategoryModel>
    implements _CategoryModel {}

enum CategoryType { income, expenses }

@Table(name: 'category')
class _CategoryModel {
  @Column(primaryKey: true)
  int id;

  @Column()
  String name;

  @Column()
  CategoryType categoryType;

  ManagedSet<MovementModel> movements;
}
