import 'package:flutter/material.dart';
import 'package:friend_request_fb/views/home_page.dart';

void main(){
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'FB POST DEMO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
