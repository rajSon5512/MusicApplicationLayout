import 'package:app_music_player/pages/listpage.dart';
import 'package:flutter/material.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ListPage()
    );
  }
}
