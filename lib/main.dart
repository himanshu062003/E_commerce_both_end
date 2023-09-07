import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:websitesticker/client/client_screen/Client_home.dart';
import 'package:websitesticker/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return  GetMaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color.fromRGBO(249, 98, 125,1),
      iconTheme: IconThemeData(
        color: Colors.white
      )

    ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const splashscreen(),
    );
  }
}
