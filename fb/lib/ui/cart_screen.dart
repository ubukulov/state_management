import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fb/business/blocs/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_bloc: cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading) {
            return Center(child: CircularProgressIndicator(),);
          } else if(state is CartLoaded) {
            return ListView.builder(
              itemCount: state.cart.itemQuantity(state.cart.products).keys.length,
              itemBuilder: (context, index) {
                final product = state.cart.products[index];
                return ListTile(
                    title: Text(product.name),
                    subtitle: Text('${product.price.toString()} \$'),
                    trailing: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveProduct(product));
                            final snackBar = SnackBar(
                              content: Text('${product.name} removed from cart.'),
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
            );
          } else {
            return Text('Что-то произошло!');
          }
        },
      ),
    );
  }

}