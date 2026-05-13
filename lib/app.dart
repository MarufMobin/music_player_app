import 'package:flutter/material.dart';
import 'package:music_player_app/presentation/screen/home/home_screen.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
