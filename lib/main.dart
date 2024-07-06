import 'package:flutter/material.dart';
import 'package:new_adv_exam/controller/data_provider.dart';
import 'package:new_adv_exam/screens/home/home_screen.dart';
import 'package:new_adv_exam/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DataProvider(),),
    ],child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
