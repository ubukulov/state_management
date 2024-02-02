import 'package:fb/business/models/product.dart';

class ProductRepository {
  List<Product> getProducts() {
    return [
      Product(id: '1', name: 'Product 1', price: 20.0),
      Product(id: '2', name: 'Product 2', price: 30.0),
      Product(id: '3', name: 'Product 3', price: 15.0),
    ];
  }
}