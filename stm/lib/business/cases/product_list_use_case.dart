import 'package:stm/data/repositories/product_repository.dart';
import 'package:stm/business/product.dart';

class ProductListUseCase  {
  final ProductRepository productRepository;

  ProductListUseCase ({required this.productRepository});

  Future<List<Product>> execute () {
    return productRepository.getProducts();
  }
}