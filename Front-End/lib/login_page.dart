import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'createAcc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/doc2.png'),
                fit: BoxFit.cover,
              )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[500].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'User Name',
                                  prefix: Padding(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[500].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Password',
                                    prefix: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10)),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                  ),
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                              ),
                            ),
                            Text(
                              'Forgot Password?',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  //Navigator.push(context,
                                  // MaterialPageRoute(builder: (context)=> CreateAccount()),);
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    'Login',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Container(
                              child: TextButton(
                                child: Text('CreateAccount'),
                                onPressed: () {
                                  // Navigate to second route when tapped.
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=> CreateAccount()),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
