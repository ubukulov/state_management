import 'package:fr/business/product.dart';

abstract class CartRepository {

  Future<List<Product>> getCartItems();

  Future<void> addToCart(Product product);

  Future<void> removeFromCart(Product product);
}