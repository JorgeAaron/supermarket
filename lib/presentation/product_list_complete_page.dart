import 'package:flutter/material.dart';
import 'package:supermarket/data/db/product_db.dart';
import 'package:supermarket/presentation/widgets/product_card.dart';

class ProductListComplete extends StatefulWidget {
  @override
  _ProductListCompleteState createState() => _ProductListCompleteState();
}

class _ProductListCompleteState extends State<ProductListComplete> {
  bool listSale = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index], listSale: listSale);
            }),
      ),
    );
  }
}
