import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:overlay_support/overlay_support.dart';

String fcmToken;

class MessageHandler extends StatefulWidget {
  final Widget child;
  MessageHandler({this.child});
  @override
  State createState() => MessageHandlerState();
}

class MessageHandlerState extends State<MessageHandler> {
  final Firestore db = Firestore.instance;
  final FirebaseMessaging fm = FirebaseMessaging();
  Widget child;
  @override
  void initState() {
    super.initState();
    child = widget.child;
    fm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: ${message['data']['screen']}");
        String screen = message['data']['screen'];
        if (screen == "secondScreen") {
          Navigator.of(context).pushNamed("secondScreen");
        } else if (screen == "thirdScreen") {
          Navigator.of(context).pushNamed("thirdScreen");
        } else {
          showSimpleNotification(Text(message['notification']['body']),
              background: Colors.black, elevation: 5);
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onMessage: ${message['data']['screen']}");
        String screen = message['data']['screen'];
        if (screen == "secondScreen") {
          Navigator.of(context).pushNamed("secondScreen");
        } else if (screen == "thirdScreen") {
          Navigator.of(context).pushNamed("thirdScreen");
        } else {
          showSimpleNotification(Text(message['notification']['body']),
              background: Colors.black, elevation: 5);
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onMessage: ${message['data']['screen']}");
        String screen = message['data']['screen'];
        if (screen == "secondScreen") {
          Navigator.of(context).pushNamed("secondScreen");
        } else if (screen == "thirdScreen") {
          Navigator.of(context).pushNamed("thirdScreen");
        } else {
          showSimpleNotification(Text(message['notification']['body']),
              background: Colors.black, elevation: 5);
        }
      },
    );
    saveDeviceToken() async {
      fcmToken = await fm.getToken();
      if (fcmToken != null) {
        var tokenRef = Firestore.instance
            .collection("users")
            .document("abdulmalik")
            .collection("tokens")
            .document("deviceToken");

        await tokenRef.setData({
          'token': fcmToken,
          "createdAt": FieldValue.serverTimestamp(),
          "platform": Platform.operatingSystem
        });
      }
    }

    saveDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
