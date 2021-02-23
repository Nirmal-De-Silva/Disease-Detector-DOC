import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets\layout4.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45,BlendMode.darken),
      ),
      ),
    );
  }
}
