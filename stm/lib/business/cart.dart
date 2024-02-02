import 'package:flutter/material.dart';
import 'package:stm/business/product.dart';

class Cart extends ChangeNotifier{
  final List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  double getTotalPrice() {
    return _items.fold(0.0, (sum, product) => sum + product.price);
  }
}