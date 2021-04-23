import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_disease_detector/screens/camera/camera.dart';
import 'package:flutter_app_disease_detector/screens/disease_detection/diseaseDetection.dart';
import 'package:flutter_app_disease_detector/services/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




// import 'package:http/http.dart' as https;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String testString = '';
  // String url = "http://192.168.42.237:5003/";
  String url = "http://10.0.2.2:5003/";
  // String url = "http://127.0.0.1:5003/";

  final AuthService _auth = AuthService();  

  // String msg = "";

  Future<String> getData() async{
    
    print(url);
    // var response = await new Dio().get(url);  
    
    Response response;
    var dio = Dio();
    response = await dio.get(url);

    // http.Response response = await http.get(
    //   Uri.http(url,"")
    // );
    
    // 
    // var DecodeData = jsonDecode(response.toString());
    // print(DecodeData);
    //print(response.data.toString());

    Map<String, dynamic> map = json.decode(response.toString());
    print(map);

    print(map["chat"]); 

    print("...................");

    String jsonString;

    Map<String, dynamic> chat;

    // chat = json.decode(response.data);

    //var _list = chat.values.toList();

    //print(_list[1]);

    // final body = json.decode(response.data.toString());

    // String newString = body.toString();
    // print(newString);

    print("after func");

    //Map jsonVal = jsonDecode(newString);
    //print(jsonVal);
    // final decoded = json.decode(response.data) as Map<String, dynamic>;

    
  }
  
  Future<String> postData() async{

    
    
    print(url);
    var response = await new Dio().post(url);
  
    // http.Response response = await http.get(
    //   Uri.http(url,"")
    // );
    
    //     
    print(response.data);
    print(response.data.toString());
    print("after func");

    
  }

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
                  SizedBox(height: 50.0),
                  
                  Text("Checkup Type",style: TextStyle(color: Colors.green, fontSize: 40.0),),
                  SizedBox(height: 100.0,),

                  SizedBox(height: 12.0),
                  Text(testString,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  SizedBox(height: 50.0),
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
                    onPressed: (){
                      print("pressed");
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> DiseaseDetection()),);
                      getData();
                      
                    } 
                    // onPressed: () async{
                    //   print("gg");

                    // //  setState(() { 
                    // //       testString= 'Email or Password is Incorrect';


                        
                        
                    // //   });
                    // getData();

                    //   // var response = await http.get(
                    //   //   Uri.encodeFull("http://127.0.0.1:5003/"),headers: {
                    //   //     "Accept": "application/json"
                    //   //   }
                    //   //   );

                    //   //   print(response.body);

                    //   // final decoded = json.decode(response.body) as Map<String, dynamic>;

                    //   setState(() {
                    //     testString = "TEST";
                    // });
                     
                    // },
                    
                  ),
                  
                ],
            ),
          ),
          ),
      ),
    );
  }
}