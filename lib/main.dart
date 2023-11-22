import 'package:clean_architecture_ex/config/theme/app_themes.dart';
import 'package:clean_architecture_ex/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_architecture_ex/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await initializaDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const DailyNews(),
    );
  }
}
