import 'package:bloc_stream/business/models/product.dart';
import 'dart:async';
import '../models/cart.dart';

class CartBloc {

  List<Product> _cartItems = [];

  final _cartItemsController = StreamController<List<Product>>.broadcast();

  Stream<List<Product>> get cartItemsStream => _cartItemsController.stream;

  void addToCart(Product product) {
    _cartItems.add(product);
    _cartItemsController.add(List.from(_cartItems));
  }

  void removeFromCart(Product product){
    _cartItems.removeWhere((item) => item.id == product.id);
    _cartItemsController.add(List.from(_cartItems));
  }
}