import 'package:flutter/material.dart';
import 'package:flutter_app_disease_detector/models/users.dart';
import 'package:flutter_app_disease_detector/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_disease_detector/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value:AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
        
      ),
    );
  }
}

