import 'package:fmobx/business/models/product.dart';

abstract class ProductRepository{
  List<Product> getProducts();
}