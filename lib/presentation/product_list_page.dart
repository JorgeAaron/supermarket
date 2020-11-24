import 'package:flutter/material.dart';
import 'package:supermarket/data/db/product_db.dart';
import 'package:supermarket/presentation/product_list_complete_page.dart';
import 'package:supermarket/presentation/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  bool logged = false;

  ProductList({this.logged});
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool listSale = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                    product: products[index], listSale: listSale);
              }),
        ),
        MaterialButton(
          child: Text('Ver todos ->'),
          color: Colors.amber,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListComplete()),
            );
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        )
      ],
    );
  }
}
