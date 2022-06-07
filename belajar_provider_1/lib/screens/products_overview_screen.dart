import 'package:belajar_provider_1/Provider/cart.dart';
import 'package:belajar_provider_1/screens/cart_screen.dart';
import 'package:belajar_provider_1/widgets/badge,.dart';
import 'package:belajar_provider_1/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, child) {
              return Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  },
                ),
                value: value.jumlah.toString(),
              );
            },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
