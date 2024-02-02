import 'package:hr/business/product.dart';

abstract class ProductRepository {
  List<Product> getAllProducts();
}