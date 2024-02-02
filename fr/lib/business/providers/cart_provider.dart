import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fr/data/state.dart';
import 'package:fr/business/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});