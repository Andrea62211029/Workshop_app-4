import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
// ignore: use_key_in_widget_constructors
class ParentWidget extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _data = 'Initial Data';

  void _updateData(String newData) {
    setState(() {
      _data = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_data),
          ChildWidget(callback: _updateData),
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  final Function(String) callback;

  const ChildWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback('Data from Child');
      },
      child: const Text('Send Data to Parent'),
    );
  }
}
