import 'package:fredux/business/actions/actions.dart';
import 'package:fredux/business/models/models.dart';
import 'package:redux/redux.dart';


final cartReducer = combineReducers<Cart>([
  TypedReducer<Cart, AddProductAction>(_addToCart),
  TypedReducer<Cart, RemoveProductAction>(_removeFromCart),
]);

Cart _addToCart(Cart cart, AddProductAction action) {
  return cart.copyWith(products: List.from(cart.products)..add(action.product));
}

Cart _removeFromCart(Cart cart, RemoveProductAction action) {
  return cart.copyWith(products: List.from(cart.products)..remove(action.product));
}