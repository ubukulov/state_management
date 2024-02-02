import 'package:stm/data/repositories/cart_repository.dart';
import 'package:stm/business/product.dart';

class CartRepositoryImpl extends CartRepository {
  final List<Product> _cartItems = [];

  @override
  Future<void> addToCart(Product product) async {
    _cartItems.add(product);
  }

  @override
  Future<List<Product>> getCarts() async {
    return _cartItems;
  }

  @override
  Future<void> removeFromCart(Product product) async {
    _cartItems.remove(product);
  }
}