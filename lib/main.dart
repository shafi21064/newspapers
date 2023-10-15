import 'package:flutter/material.dart';
import 'package:newspaper/src/controller/news_controller/news_controller.dart';
import 'package:newspaper/src/moduls/home/home_page.dart';
import 'package:newspaper/src/moduls/news_web/news.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NewsProvider())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
