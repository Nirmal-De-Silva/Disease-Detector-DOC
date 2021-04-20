import 'package:flutter/material.dart';
import 'package:flutter_app_disease_detector/screens/camera/camera.dart';
import 'package:flutter_app_disease_detector/services/auth.dart';
import 'dart:io';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();  


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/layout2.png'),
            
            fit: BoxFit.cover,          
            
          ),
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Doc Disease'),
          backgroundColor: Colors.green[500],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],

          ),
          body: Container(         
            
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0), 
            
            child: Form(              
              child: Column(
                children: <Widget>[
                  SizedBox(height: 120.0),
                  
                  Text("Checkup Type",style: TextStyle(color: Colors.green, fontSize: 40.0),),
                  SizedBox(height: 150.0,),
                  RaisedButton.icon(
                    icon: Icon((Icons.camera_alt)),                                        
                    padding: EdgeInsets.fromLTRB(77.5,15,77.5,10),
                    color: Colors.green[400],
                    label: Text(
                      'Eye Related',style: TextStyle(color: Colors.white),
                    ),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {  
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> Camera()),);;
                     
                     
                    },
                  ),
                     SizedBox(height: 20.0),
                  RaisedButton.icon(
                    icon: Icon(Icons.chat),
                    padding: EdgeInsets.fromLTRB(96.5,15,96.5,15),
                    color: Colors.green[400],
                    label: Text(
                      'Other',style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () async{                    
                     
                     
                    },
                  ),
                ],
            ),
          ),
          ),      
      ),
    );
  }
}