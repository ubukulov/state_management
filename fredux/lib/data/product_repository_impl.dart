import 'package:fredux/business/models/product.dart';
import 'package:fredux/data/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  List<Product> getProducts() {
    return [
      Product(id: '1', name: 'Ноутбук Mac Book Pro', price: 1500.0),
      Product(id: '2', name: 'Ноутбук Acer Nitro',   price: 1000.0),
      Product(id: '3', name: 'Ноутбук Dell Inspiro', price: 900.0),
    ];
  }
}