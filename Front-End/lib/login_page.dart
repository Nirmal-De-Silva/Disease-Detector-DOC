import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: LoginPage()
  ));

class LoginPage extends StatelessWidget {
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
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: FlatButton(
                                onPressed: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 20),
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
                              decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                    BorderSide(color: Colors.black12, width: 1),
                                  )),
                              child: Text(
                                'CreateNewAccount',
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



