import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Anim Search Bar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 200),
          child: AnimSearchBar(
            duration: Duration(milliseconds: 300,),
            border: OutlineInputBorder(),
          ),
        )
      ),
    );
  }
}

