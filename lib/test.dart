import 'package:flutter/material.dart';

/// Flutter code sample for [ExpansionPanelList].

void main() => runApp(const ExpansionPanelListExampleApp());

class ExpansionPanelListExampleApp extends StatelessWidget {
  const ExpansionPanelListExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}

