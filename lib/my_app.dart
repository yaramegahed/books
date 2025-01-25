import 'package:books/features/figma/figma_screen.dart';
import 'package:flutter/material.dart';

import 'features/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: FigmaScreen(),

    );
  }
}