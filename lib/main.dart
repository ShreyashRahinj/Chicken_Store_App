import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vresto/data/foodlist.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FoodList(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
