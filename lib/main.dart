
import 'package:flutter/material.dart';
import 'context_menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(title: const Text('Context Menu Demo')),
        body: Center(
          child: ContextMenu(
            child: Container(
              width: 150,
              height: 80,
              color: Colors.teal,
              alignment: Alignment.center,
              child: const Text(
                'Right-click or long press',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
