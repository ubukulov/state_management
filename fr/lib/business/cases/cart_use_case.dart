import 'package:fr/data/repositories/cart_repository.dart';
import 'package:fr/business/product.dart';

class CartUseCase {
  final CartRepository cartRepository;

  CartUseCase ({required this.cartRepository});

  Future<void> addToCart(Product product) async {
    return cartRepository.addToCart(product);
  }

  Future<List<Product>> execute() async {
    return cartRepository.getCartItems();
  }

  Future<void> removeFromCart(Product product) async {
    cartRepository.removeFromCart(product);
  }
}