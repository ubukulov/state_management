import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fredux/business/actions/actions.dart';
import 'package:fredux/business/models/models.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_redux: cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: StoreConnector<Cart, List<Product>>(
        converter: (store) => store.state.products,
        builder: (context, state) {
          if(state.isNotEmpty) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final product = state[index];
                return ListTile(
                    title: Text(product.name),
                    subtitle: Text('${product.price.toString()} \$'),
                    trailing: ElevatedButton(
                      onPressed: () {

                        StoreProvider.of<Cart>(context).dispatch(RemoveProductAction(product));

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
                      child: Icon(Icons.remove_circle),
                    )
                );
              },
            );
          } else {
            return Center(child: Text('Корзина пуста'),);
          }
        },
      ),
    );
  }

}