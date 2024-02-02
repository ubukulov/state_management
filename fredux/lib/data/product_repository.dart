import 'package:fredux/business/models/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
}