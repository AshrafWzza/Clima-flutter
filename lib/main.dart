import 'package:clima_flutter/screens/loading_screen.dart';
import 'package:flutter/material.dart';

//Todo: add AutoComplete TextField & AutoComplete Search for cities
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}
