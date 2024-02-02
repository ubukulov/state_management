import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hr/data/state.dart';
import 'package:hr/business/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});