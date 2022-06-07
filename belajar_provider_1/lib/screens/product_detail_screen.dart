import 'package:belajar_provider_1/Provider/all_product.dart';
import 'package:belajar_provider_1/Provider/cart.dart';
import 'package:belajar_provider_1/screens/cart_screen.dart';
import 'package:belajar_provider_1/widgets/badge,.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    // ...
    final ProductId = Provider.of<Products>(context)
        .allProduct
        .firstWhere((prodId) => prodId.id == productId);

    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          actions: [
            Consumer<Cart>(
              builder: (context, value, child) {
                return Badge(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CartScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                  value: value.jumlah.toString(),
                );
              },
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.network(
                '${ProductId.imageUrl}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Text("INI ADALAG PAGE PRODUK ${ProductId.title}"),
            SizedBox(height: 15),
            Text("\$${ProductId.price}"),
            SizedBox(height: 15),
            Text("${ProductId.description}"),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Berhasil ditambahkan"),
                ));
                cart.addCart(
                  ProductId.id,
                  ProductId.title,
                  ProductId.price,
                );
              },
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
