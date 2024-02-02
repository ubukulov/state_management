import 'package:stm/data/repositories/product_repository.dart';
import 'package:stm/business/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    return [
      Product(id: '1', name: 'Smartphone Iphone',  price: 1000.0),
      Product(id: '2', name: 'Smartphone Samsung', price: 900.0),
      Product(id: '3', name: 'Smartphone Redmi 9', price: 600.0),
    ];
  }
}