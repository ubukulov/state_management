
import 'package:fb/business/blocs/cart_bloc.dart';
import 'package:fb/data/product_repository.dart';
import 'package:fb/ui/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:fb/business/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {

  final ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {

    List<Product> products = productRepository.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_bloc: products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if(state is CartLoaded) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.shopping_cart),
                      Positioned(
                          right: 1,
                          bottom: 10,
                          child: Text(
                              state.cart.products.length.toString(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              )
                          )
                      )
                    ],
                  );
                } else {
                  return Icon(Icons.shopping_cart);
                }
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price.toString()} \$'),
            trailing: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<CartBloc>()..add(AddProduct(product));
                    final snackBar = SnackBar(
                      content: Text('${product.name} added to cart.'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Icon(Icons.add),
                );
              },
            )
          );
        },
      ),
    );
  }

}