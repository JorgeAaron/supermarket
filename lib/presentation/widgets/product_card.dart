import 'package:flutter/material.dart';
import 'package:supermarket/data/models/product_model.dart';
import 'package:supermarket/presentation/product_details_page.dart';

class ProductCard extends StatefulWidget {
  final bool listSale;
  final Product product;

  ProductCard({this.product, this.listSale});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.product.sale) {
      return Card(
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(
                          product: widget.product,
                        )),
              );
            },
            leading: Image.network(widget.product.imageUrl),
            title: Text(widget.product.name),
            subtitle:
                Text("\$" + widget.product.price.toString() + " el medio Kg"),
            trailing: widget.product.sale ? Text('EN OFERTA!') : Text('')),
      );
    } else if (widget.listSale == false) {
      return Card(
        child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(
                          product: widget.product,
                        )),
              );
            },
            leading: Image.network(widget.product.imageUrl),
            title: Text(widget.product.name),
            subtitle:
                Text("\$" + widget.product.price.toString() + " el medio Kg"),
            trailing: widget.product.sale ? Text('EN OFERTA!') : Text('')),
      );
    } else {
      return Container();
    }
  }
}
