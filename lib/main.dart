import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_store_ui/controllers/dark_mode_controller.dart';
import 'package:play_store_ui/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkModeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
