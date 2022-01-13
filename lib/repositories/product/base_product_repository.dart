import 'package:ecommerce_ap/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
