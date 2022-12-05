import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/screens/home_screen.dart';
import 'package:weather/screens/second_screen.dart';

void main() {
  runApp(const ProviderScope( child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => HomePage(),
        '/second': (context) => SecondScreen()
      },
    );
  }
}

