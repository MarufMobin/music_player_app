import 'package:flutter/material.dart';
import 'package:music_player_app/core/constants/app_colors.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen'),
      ),
    );
  }
}