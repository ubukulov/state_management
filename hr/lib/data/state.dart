import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hr/business/product.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }

  List<Product> getCartItems() {
    return state;
  }
}