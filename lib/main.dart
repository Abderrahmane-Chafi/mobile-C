import 'package:final_p/Screens/login.page.dart';
import 'package:final_p/Screens/register.page.dart';
import 'package:final_p/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'Screens/home.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true),
      title: 'My App',
      //home: HomePage(),
      initialRoute: '/login',
      routes: {
        '/login':(context)=>LoginPage(),
        '/register':(context)=>RegisterPage(),
        '/home':(context)=>HomePage(),
      },
    );
  }
}
