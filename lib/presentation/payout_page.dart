import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supermarket/presentation/widgets/appbar_custom.dart';

class PayoutPage extends StatefulWidget {
  @override
  _PayoutPageState createState() => _PayoutPageState();
}

class _PayoutPageState extends State<PayoutPage> {
  var currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var date = DateFormat('j').format(currentDate);
    int minTime = currentDate.hour + 3;
    int _value = 1;

    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  currentDate.hour >= 6
                      ? Text('Recibira su pedido mañana')
                      : Text('Recibira su pedido como minimo a las:' +
                          minTime.toString() +
                          'horas'),
                  Text('Modalidad de pago:'),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: DropdownButton(
                        value: _value,
                        items: [
                          DropdownMenuItem(
                            child: Text("Pagar en efectivo"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Pagar con tarjeta"),
                            value: 2,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                  _value == 2 ? TextField() : Container(),
                  FlatButton(
                    color: Colors.amber,
                    child: Text('Realizar pago'),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
