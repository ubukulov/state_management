import 'package:equatable/equatable.dart';
import 'package:fb/business/models/product.dart';

class Cart extends Equatable {
  final List<Product> products;

  Cart({
    this.products = const <Product>[]
  });

  Cart copyWith({
    List<Product>? products
  }) {
    return Cart(
      products: products ?? this.products
    );
  }

  @override
  List<Object?> get props => [products];

  Map itemQuantity(products) {
    var quantity = Map();

    products.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }
}