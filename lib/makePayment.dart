import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'PaypalPayment.dart';

class MakePayment extends StatefulWidget {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          backgroundColor: Colors.transparent,
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(45.0),
            child: new AppBar(
              backgroundColor: Colors.white,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Prueba de pagar con Paypal',
                    style: TextStyle(
                        fontSize: 16.0, color: Colors.blue[400], fontWeight: FontWeight.bold, fontFamily: 'Open Sans'),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[400],
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        // make PayPal payment

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaypalPayment(
                              onFinish: (number) async {
                                // payment done
                                print('Order id: ' + number);
                                _message = 'Order id: ' + number;
                                setState(() {});
                              },
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Pay with Paypal',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(_message),
                    )
                  ],
                ),
              )),
        ));
  }
}
