import 'package:flutter/material.dart';

import 'stream_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamPage(),
    );
  }
}