import 'dart:async';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final StreamController<String> _streamController = StreamController<String>();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _startStream();
  }

  void _startStream() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      _counter++;
      _streamController.add("Item $_counter");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Stream Example'),
      ),
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
           List<String> items = (snapshot.data as List<String>) ?? [];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
