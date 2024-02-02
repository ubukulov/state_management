import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hr/business/product.dart';
import 'package:hr/business/usecases/case_get_product.dart';
import 'package:hr/data/product_repository_impl.dart';

final productProvider = Provider<List<Product>>((ref) {
  final getProducts = ref.read(getProductsProvider);
  return getProducts.execute();
});

final getProductsProvider = Provider<GetProducts>((ref) {
  return GetProducts(ProductRepositoryImpl());
});