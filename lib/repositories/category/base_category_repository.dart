import 'package:ecommerce_ap/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
