import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fredux/business/reducers/cart_reducer.dart';
import 'package:fredux/ui/products_screen.dart';
import 'package:redux/redux.dart';
import 'package:fredux/business/models/models.dart';

void main() {

  final store = Store<Cart>(
    cartReducer,
    initialState: Cart(products: [])
  );

  runApp(ReduxApp(store: store,));
}

class ReduxApp extends StatelessWidget {
  final Store<Cart> store;

  ReduxApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsScreen(),
      ),
    );
  }
}