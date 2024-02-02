import 'package:fmobx/data/product_repository.dart';
import 'package:fmobx/data/product_repository_impl.dart';
import 'package:fmobx/business/models/product.dart';
import 'package:fmobx/business/models/cart.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  final ProductRepository _productRepository = ProductRepositoryImpl();

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  ObservableList<Cart> cartItems = ObservableList<Cart>();

  @computed
  double get cartTotal =>
      cartItems.fold(0, (total, cartItem) => total + cartItem.product.price * cartItem.quantity);

  @action
  void addToCart(Product product) {
    if (cartItems.any((item) => item.product.id == product.id)) {
      final index = cartItems.indexWhere((item) => item.product.id == product.id);
      cartItems[index] = Cart(product: product, quantity: cartItems[index].quantity + 1);
    } else {
      cartItems.add(Cart(product: product, quantity: 1));
    }
  }

  @action
  void removeFromCart(Cart cart) {
    cartItems.remove(cart);
  }

  @action
  void loadProducts() {
    products = _productRepository.getProducts().asObservable();
  }
}