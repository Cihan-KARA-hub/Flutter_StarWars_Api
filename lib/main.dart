import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:star_wars/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
          textTheme: Typography.whiteCupertino,
          appBarTheme:
              AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light)),
      home: const Welcome(),
    );
  }
}
