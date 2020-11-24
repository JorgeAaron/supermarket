import 'package:flutter/material.dart';

import '../cart_page.dart';
import '../payout_page.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Supermarket'),
      actions: [
        FlatButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PayoutPage()),
              );
            },
            icon: Icon(Icons.add_box_outlined),
            label: Text('Pedidos')),
        FlatButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Carrito')),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
