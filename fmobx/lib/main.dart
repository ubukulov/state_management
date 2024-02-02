import 'package:flutter/material.dart';
import 'package:fmobx/data/cart_store.dart';
import 'package:fmobx/ui/products_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartStore cartStore = CartStore();

  @override
  Widget build(BuildContext context) {
    cartStore.loadProducts();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(cartStore: cartStore),
    );
  }
}