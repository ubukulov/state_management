import 'package:hr/business/product.dart';
import 'package:hr/data/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  List<Product> getAllProducts() {
    return [
      Product(1, 'Смартфон Iphone 13', 1000.0),
      Product(2, 'Смартфон Samsung Galaxy', 900.0),
      Product(3, 'Смартфон Redmi 9', 600.0),
    ];
  }
}