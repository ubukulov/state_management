import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fb/business/models/cart.dart';
import 'package:fb/business/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartLoading()) {
    on<StartCart>(_onStartCart);
    on<AddProduct>(_onAddProduct);
    on<RemoveProduct>(_onRemoveProduct);
  }

  void _onStartCart(
      StartCart event,
      Emitter<CartState> emit,
      ) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(cart: Cart()));
    } catch (_) {}
  }

  void _onAddProduct(
      AddProduct event,
      Emitter<CartState> emit,
      ) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: state.cart.copyWith(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }

  void _onRemoveProduct(
      RemoveProduct event,
      Emitter<CartState> emit,
      ) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: state.cart.copyWith(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {}
    }
  }
}