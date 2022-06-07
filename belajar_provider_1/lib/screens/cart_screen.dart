import 'package:belajar_provider_1/Provider/cart.dart';
import 'package:belajar_provider_1/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text("Total Harga = \$${cart.totalHarga} "),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${cart.items.values.toList()[index].title} "),
                  subtitle: Text("${cart.items.values.toList()[index].id}"),
                  trailing: Container(
                    child: Text("\$${cart.items.values.toList()[index].price}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
