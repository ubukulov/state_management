// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<double>? _$cartTotalComputed;

  @override
  double get cartTotal => (_$cartTotalComputed ??=
          Computed<double>(() => super.cartTotal, name: '_CartStore.cartTotal'))
      .value;

  late final _$productsAtom =
      Atom(name: '_CartStore.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: '_CartStore.cartItems', context: context);

  @override
  ObservableList<Cart> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<Cart> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void addToCart(Product product) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addToCart');
    try {
      return super.addToCart(product);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart(Cart cart) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.removeFromCart');
    try {
      return super.removeFromCart(cart);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadProducts() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
cartItems: ${cartItems},
cartTotal: ${cartTotal}
    ''';
  }
}
