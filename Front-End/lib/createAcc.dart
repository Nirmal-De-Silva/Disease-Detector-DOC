import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profilePage.dart';
import 'login_page.dart';

class CreateAccount extends StatelessWidget {
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
                    height: 200,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                                    hintText: 'Full Name',
                                    prefix: Padding(
                                        padding:
                                        EdgeInsets.symmetric(horizontal: 10)),
                                    contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                  ),
                                  textInputAction: TextInputAction.next,
                                ),
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
                                    hintText: 'Confirm Password',
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
                            Row(
                              children: [
                                Text('Already a user?'),
                                TextButton(
                                  child: Text('Log In'),
                                  onPressed: () {
                                    // Navigate to second route when tapped.
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> LoginPage()),
                                    );
                                  },
                                ),
                              ],

                            ),

                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> profile_page()),);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      'SIGN UP',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
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
