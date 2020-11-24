import 'package:flutter/material.dart';
import 'package:supermarket/data/db/user_db.dart';
import 'package:supermarket/data/models/product_model.dart';
import 'package:supermarket/presentation/payout_page.dart';
import 'package:supermarket/presentation/widgets/appbar_custom.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: <Widget>[
          Container(
            child: FutureBuilder(
                future: DBProvider.db.database,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return _showList(context);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          FlatButton(
              onPressed: () {
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayoutPage(),
                      ));
                }
              },
              child: Text('Comprar'))
        ],
      ),
    );
  }

  _showList(BuildContext context) {
    return FutureBuilder(
        future: DBProvider.db.getAllproducts(),
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                for (Product product in snapshot.data)
                  ListTile(
                    leading: Text(product.imageUrl),
                    title: Text(product.name),
                    subtitle: Text(product.price.toString()),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _deleteProduct(product);
                          setState(() {});
                        }),
                  )
              ],
            );
          } else {
            return Center(
              child: Text("No hay nada!"),
            );
          }
        });
  }

  _deleteProduct(Product product) async {
    await DBProvider.db.deleteCart(product);
  }
}
