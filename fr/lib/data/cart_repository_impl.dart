import 'package:fr/data/repositories/cart_repository.dart';
import 'package:fr/business/product.dart';

class CartRepositoryImpl extends CartRepository {
  final List<Product> _cartItems = [];

  @override
  Future<void> addToCart(Product product) async {
    _cartItems.add(product);
  }

  @override
  Future<List<Product>> getCartItems() async {
    return _cartItems;
  }

  @override
  Future<void> removeFromCart(Product product) async {
    _cartItems.remove(product);
  }
}