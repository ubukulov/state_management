import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr/business/product.dart';

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