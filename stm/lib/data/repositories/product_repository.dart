import 'package:stm/business/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
}