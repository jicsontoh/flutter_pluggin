import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pluggin/pluggin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _greetings = 'Hi from Flutter';
  bool _switch = false;
  String _original = 'Hello this is Flutter';
  IconData _icon = Icons.update;
  IconData _ori = Icons.phonelink_erase;
  Color _color = Colors.white;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initGreetingState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await Pluggin.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initGreetingState() async {
    String greetingMsg;
    IconData icon = _icon;
    String? device;

    try {
      greetingMsg = await Pluggin.defaultGreeting ?? 'Unknown';
      device = await Pluggin.icon;
      icon = device == "andriod" ? Icons.android_rounded : Icons.apple_outlined;
    } on PlatformException {
      greetingMsg = 'Failed';
    }

    if (!mounted) return;

    setState(() {
      _greetings = greetingMsg;
      _icon = icon;
      _color = device == "andriod" ? Colors.green : Colors.white70;
    });
  }

  Widget base() {
    return Container(
      color: !_switch ? Colors.red : _color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(_switch ? _icon : _ori, size: 50,),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _switch = !_switch;
                });
              },),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_switch ? _greetings : _original, style: TextStyle(fontSize: 20),),
              ],)
          ]),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Plugin example app'),
            ),
            body: base()
        )
    );
  }
}
