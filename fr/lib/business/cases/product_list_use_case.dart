import 'package:fr/data/product_repository_impl.dart';
import 'package:fr/data/repositories/product_repository.dart';
import 'package:fr/business/product.dart';

class ProductListUseCase  {
  final ProductRepository productRepository;

  ProductListUseCase (this.productRepository);

  List<Product> execute () {
    return productRepository.getProducts();
  }
}