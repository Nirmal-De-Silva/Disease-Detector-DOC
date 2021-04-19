import 'package:flutter/material.dart';
import 'package:flutter_app_disease_detector/loading/loading.dart';
import 'package:flutter_app_disease_detector/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
  }

class _SignInState extends State<SignIn> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  TextEditingController emailController = new TextEditingController();
  String regex = '^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]';

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    
    return Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/layout1.png'),
            
            fit: BoxFit.cover,
          
            
          ),
          ),
      child: loading ? Loading() : Scaffold(
      
                
        
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green[500],
          elevation: 0.0,
          title: Text('Sign in to DOC'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: (){
                widget.toggleView();
              },
            )
          ],
          ),
          body: Container(         
            
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0), 
            
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 87.0),
                  
                  TextFormField(
                    
                    decoration: InputDecoration(                  
                    border: new OutlineInputBorder(                     
                        borderRadius: const BorderRadius.all(const Radius.circular(16.0)),                      
                      ),

                      hintText: 'Email',
                      fillColor: Colors.grey[500].withOpacity(0.5),
                      filled: true,                            
                      
                      prefix: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10)),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 10),
                    ),
                    controller: emailController,
                    validator: (val) => val.isEmpty  ? 'Enter a valid Email' : null,
                    onChanged: (val){
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField( 
                    decoration: InputDecoration(                  
                    border: new OutlineInputBorder(                     
                        borderRadius: const BorderRadius.all(const Radius.circular(16.0)),                      
                      ),
                                                          
                      hintText: 'Pssword',
                      fillColor: Colors.grey[500].withOpacity(0.5),
                      filled: true,                            
                      
                      prefix: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10)),
                        contentPadding:
                        const EdgeInsets.symmetric(vertical: 10),
                    ),                 
                    obscureText: true,
                    validator: (val) => val.length<6 ? 'Enter a password with 6+ charactors' : null,
                    onChanged: (val){
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(105,15,105,15),
                    color: Colors.green[400],
                    child: Text(
                      'Sign in',style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () async{
                      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if(!regex.hasMatch(emailController.text)){
                        setState(() => error = 'Please Enter Valid Email');
                      }
                     if(_formKey.currentState.validate()){
                       setState(() => loading = true);
                       dynamic result = await _auth.signInWithEmailAndPassword(email, password);                   
                        if(result == null){
                          setState(() { 
                          error = 'Email or Password is Incorrect';
                          loading = false;
                        });                      
                      }
                     }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  
                ],
              ),
              
            ),
            
          ),
          
      ),
    );
    
    
  }
  
}