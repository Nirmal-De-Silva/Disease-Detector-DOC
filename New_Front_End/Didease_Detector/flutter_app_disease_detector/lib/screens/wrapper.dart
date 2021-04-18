import 'package:flutter/material.dart';
import 'package:flutter_app_disease_detector/models/users.dart';
import 'package:flutter_app_disease_detector/screens/authenticate/authenticate.dart';
import 'package:flutter_app_disease_detector/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Users>(context);
    print(user);

    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}