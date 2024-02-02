import 'package:bloc_stream/data/product_repository.dart';
import 'package:bloc_stream/ui/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bloc_stream/business/blocs/cart_bloc.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final cartBloc = Provider.of<CartBloc>(context);

    final _productRepository = ProductRepository();
    final products = _productRepository.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('bloc_stream: products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toString()}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                cartBloc.addToCart(product);
              },
            ),
          );
        },
      ),
    );
  }
}