import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr/business/product.dart';
import 'package:fr/business/cases/product_list_use_case.dart';
import 'package:fr/data/product_repository_impl.dart';

final productProvider = Provider<List<Product>>((ref) {
  final getProducts = ref.read(getProductsProvider);
  return getProducts.execute();
});

final getProductsProvider = Provider<ProductListUseCase>((ref) {
  return ProductListUseCase(ProductRepositoryImpl());
});