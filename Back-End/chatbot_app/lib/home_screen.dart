import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Defining some properties and variables
  //We need state key for animated list state

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];
  //in flask app we define the route for our query i.e. /bot
  static const String BOT_URL =
      "https://flutter-chatbot-application.herokuapp.com/bot";
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        centerTitle: true,
        title: Text("Chat Bot"),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedList(
            key: _listKey,
            initialItemCount: _data.length,
            itemBuilder:
                (BuildContext context, int index, Animation animation) {
              return buildItem(_data[index], animation, index);
            },
          ),
          //Text field icon field
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.message,
                        color: Colors.green[900],
                      ),
                      hintText: " Hello!",
                      fillColor: Colors.amberAccent,
                    ),
                    controller: queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg) {
                      this.getResponse();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Response
  void getResponse() {
    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);
      var client = getClient();
      // try {
      //   client.post(
      //     BOT_URL,
      //     body: {"query": queryController.text},
      //   )..then((response) {
      //       print(response.body);
      //       Map<String, dynamic> data = jsonDecode(response.body);
      //       insertSingleItem(data['response'] + "<bot>");
      //     });
      // } finally {
      //   client.close();
      //   queryController.clear();
      // }
    }
  }

  //Inserting single item
  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState.insertItem(_data.length - 1);
  }
}

//Creating client
http.Client getClient() {
  return http.Client();
}

//Build item widget which will take context, animation and index as parameters

Widget buildItem(String item, Animation animation, int index) {
  bool mine = item.endsWith("<bot>");
  return SizeTransition(
    sizeFactor: animation,
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        alignment: mine ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          child: Text(
            item.replaceAll("<bot>", ""),
            style: TextStyle(color: mine ? Colors.white : Colors.black),
          ),
          color: mine ? Colors.blue : Colors.grey[200],
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
  );
}
