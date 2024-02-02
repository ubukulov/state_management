import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stm/business/cart.dart';
import 'package:stm/ui/cart_screen.dart';
import 'package:stm/business/cases/product_list_use_case.dart';
import 'package:stm/data/product_repository_impl.dart';

class ProductsScreen extends StatelessWidget {

  final ProductListUseCase productListUseCase = ProductListUseCase(productRepository: ProductRepositoryImpl());

  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 1,
                  bottom: 10,
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Text(
                        cart.items.length.toString(),
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      );
                    }
                  )

                )
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: productListUseCase.execute(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data;
            return ListView.builder(
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final product = products![index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('${product.price} \$'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).addToCart(product);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
  
}