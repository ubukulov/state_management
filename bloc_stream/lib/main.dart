import 'package:bloc_stream/ui/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc_stream/business/blocs/cart_bloc.dart';
import 'package:provider/provider.dart';

import 'business/models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final CartBloc _cartBloc = CartBloc();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: _cartBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsScreen(),
      ),
    );
  }
}