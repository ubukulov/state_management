import 'package:stm/business/product.dart';

abstract class CartRepository {

  Future<List<Product>> getCarts();

  Future<void> addToCart(Product product);

  Future<void> removeFromCart(Product product);
}