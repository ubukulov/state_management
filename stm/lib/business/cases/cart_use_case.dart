import 'package:stm/data/repositories/cart_repository.dart';
import 'package:stm/business/product.dart';

class CartUseCase {
  final CartRepository cartRepository;
  final List<Product> _items = [];

  CartUseCase ({required this.cartRepository});

  Future<void> addToCart(Product product) async {
    return cartRepository.addToCart(product);
  }

  Future<List<Product>> getCartItems() async {
    return cartRepository.getCarts();
  }

  Future<void> removeFromCart(Product product) async {
    cartRepository.removeFromCart(product);
  }
}