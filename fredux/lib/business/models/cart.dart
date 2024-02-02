import 'package:fredux/business/models/models.dart';

class Cart {
  List<Product> products = [];

  Cart({required this.products});

  Cart copyWith({List<Product>? products}) {
    return Cart(products: products ?? this.products);
  }
}