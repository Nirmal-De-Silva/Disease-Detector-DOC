import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
  ));

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/layout2.png'),
                fit: BoxFit.cover,
              )),
        ),
        Scaffold(
          body: Center(
              child: Image(
                image: AssetImage('assets/layout1.png'),
                height: 2560,
                width: 1440,
                fit: BoxFit.fitWidth,
              )

            // Text(
            // 'Hello World',
            // style: TextStyle(
            //   fontSize: 20.0,
            //   fontWeight: FontWeight.bold,
            //   letterSpacing: 2.0,
            //   color: Colors.greenAccent[700],
            //   fontFamily: 'Montserrat',
            // ),
            // ),

          ),
        ),
      ],
    );
  }

}


