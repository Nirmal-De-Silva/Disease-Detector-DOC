import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
  ));

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(),
          Container(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(
                    color: Colors.green,
                    width: 5.0,
                  )
              ),
              color: Color.fromRGBO(00, 208, 21, 100), //00D015
              textColor: Colors.red,
              padding: EdgeInsets.all(20.0),
              onPressed: () {},
              child: Text(
                "Log In".toUpperCase(),
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
