import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => NewsProvider())
              ],
              child: const MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
              ));
        });
  }
}
