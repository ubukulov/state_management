
import 'package:fmobx/business/models/product.dart';
import 'package:fmobx/data/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  @override
  List<Product> getProducts() {
    return [
      Product(id: '1', name: 'Холодильник Samsung', price: 1500.0),
      Product(id: '2', name: 'Холодильник LG', price: 1100.0),
      Product(id: '3', name: 'Холодильник Artel', price: 600.0),
    ];
  }

}