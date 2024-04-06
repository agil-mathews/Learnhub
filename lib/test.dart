import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Flutter code sample for [ExpansionPanelList].

void main() => runApp(const ExpansionPanelListExampleApp());

class ExpansionPanelListExampleApp extends StatelessWidget {
  const ExpansionPanelListExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('data',style: GoogleFonts.roboto(),),
        ),
      ),
    );
  }
}

