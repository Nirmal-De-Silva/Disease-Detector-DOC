import 'package:flutter/material.dart';

class checkUpTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/layout4.png'),
                fit: BoxFit.fill,
              )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
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
                            ),

                            Padding(

                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[500].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            Text(
                              'Check Up Type',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 200,
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
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      'Eye Related',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
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
                                  onPressed: () {},
                                  child: Padding(
                                    padding:const EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      'Other',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
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



