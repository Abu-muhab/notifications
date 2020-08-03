import 'package:flutter/material.dart';
import 'package:notifications/message_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "homePage": (context) => MessageHandler(child: MyHomePage()),
        "secondScreen": (context) => SecondPage(),
        "thirdScreen": (context) => ThirdPage(),
      },
      initialRoute: "homePage",
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body:
          Container(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body:
          Container(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Page"),
      ),
      body:
          Container(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
