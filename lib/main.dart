
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_pokemon/routes/routes.dart';
import 'package:prueba_tecnica_pokemon/theme/colors_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'Pókedex',
      initialRoute: '/home',
      getPages: RoutesPages.routes
    );
  }
}
