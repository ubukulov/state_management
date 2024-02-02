import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fredux/data/product_repository_impl.dart';
import 'package:fredux/business/models/models.dart';
import 'package:fredux/ui/cart_screen.dart';
import 'package:fredux/business/actions/actions.dart';

class ProductsScreen extends StatelessWidget {
  final ProductRepositoryImpl productRepositoryImpl = ProductRepositoryImpl();

  @override
  Widget build(BuildContext context) {

    List<Product> products = productRepositoryImpl.getProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter_redux: products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: StoreConnector<Cart, List<Product>>(
                converter: (store) => store.state.products,
                builder: (context, state) {
                  if(state.isNotEmpty) {
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(Icons.shopping_cart),
                        Positioned(
                            right: 1,
                            bottom: 10,
                            child: Text(
                                state.length.toString(),
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
                }
            )
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
              trailing: ElevatedButton(
                onPressed: () {
                  StoreProvider.of<Cart>(context).dispatch(AddProductAction(product));
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
              )
          );
        },
      ),
    );
  }

}