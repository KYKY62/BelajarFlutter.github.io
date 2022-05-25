import 'package:belajar_provider_1/Provider/all_product.dart';
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
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
          ],
        ));
  }
}
