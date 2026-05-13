import 'package:flutter/material.dart';
import 'package:music_player_app/core/constants/app_colors.dart';
import 'package:music_player_app/presentation/screen/home/home_screen.dart';
import 'package:music_player_app/presentation/screen/home/provider/media_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MediaProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.surface)
        ),
        home: HomeScreen(),
      ),
    );
  }
}
