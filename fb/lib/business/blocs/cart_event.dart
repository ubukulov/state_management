part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class StartCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final Product product;

  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends CartEvent {
  final Product product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [];
}