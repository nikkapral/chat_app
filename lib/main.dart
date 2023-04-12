import 'package:chattapp/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:chattapp/theme.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.secondary, // navigation bar color
    statusBarColor: AppColors.secondary, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().dark,
      darkTheme: AppTheme().dark,
      themeMode: ThemeMode.light,
      title: 'ChattApp',
      home: HomeScreen(),
      
      
    );
  }




}