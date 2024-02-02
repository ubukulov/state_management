import 'package:hr/data/product_repository.dart';
import 'package:hr/business/product.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  List<Product> execute() {
    return repository.getAllProducts();
  }
}