import 'package:fr/business/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
}