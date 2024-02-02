import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fmobx/data/cart_store.dart';
import 'package:fmobx/ui/cart_screen.dart';

class ProductsScreen extends StatelessWidget {
  final CartStore cartStore;

  const ProductsScreen({Key? key, required this.cartStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_mobx: products'),
        actions: [
          IconButton(
            icon: Observer(
              builder: (_) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.shopping_cart),
                    Positioned(
                        right: 1,
                        bottom: 10,
                        child: Text(
                            cartStore.cartItems.length.toString(),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            )
                        )
                    )
                  ],
                );
              },
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(cartStore: cartStore)));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cartStore.products.length,
        itemBuilder: (context, index) {
          final product = cartStore.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
            onTap: () {
              // Add product to the cart
              cartStore.addToCart(product);
            },
          );
        },
      ),
    );
  }
}