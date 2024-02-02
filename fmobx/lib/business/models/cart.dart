import 'package:fmobx/business/models/product.dart';

class Cart {
  final Product product;
  final int quantity;

  Cart({required this.product, required this.quantity});
}