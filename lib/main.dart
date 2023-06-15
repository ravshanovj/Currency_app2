import 'package:firstapp1/provider/home_page_provider.dart';
import 'package:firstapp1/service/get_currency.dart';
import 'package:firstapp1/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Hive.initFlutter();
  GetService.registerAdapters();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
