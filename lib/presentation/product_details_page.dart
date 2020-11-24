import 'package:flutter/material.dart';
import 'package:supermarket/data/models/product_model.dart';
import 'package:supermarket/presentation/register_page.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  double _n = 0.5;
  int _m = 1;

  void add() {
    setState(() {
      if (_n <= widget.product.stock) {
        _n = _n + 0.5;
        _m++;
      }
    });
  }

  void minus() {
    setState(() {
      if (_n != 0.5 && _m != 1) {
        _n = _n - 0.5;
        _m--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = widget.product.price * _m;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0),
            height: 240,
            width: 500,
            child: Image.network(widget.product.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  widget.product.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '-',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$' + widget.product.price.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Cantidad:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: add,
                heroTag: 'btnAdd',
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
              ),
              Text('$_n kg', style: new TextStyle(fontSize: 60.0)),
              FloatingActionButton(
                onPressed: minus,
                heroTag: 'btnMinus',
                child: new Icon(Icons.minimize, color: Colors.black),
                backgroundColor: Colors.white,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ));
              },
              child: Text(
                'Añadir al carrito',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              color: Colors.redAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Total: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$' + total.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
