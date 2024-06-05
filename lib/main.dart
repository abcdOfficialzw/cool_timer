import 'package:cool_timer/counter/views/pages/counter_page.dart';
import 'package:cool_timer/utils/theme/color_schemes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        // textTheme: materialTextTheme()
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        //textTheme: materialTextTheme()
      ),
      themeMode: ThemeMode.system,
      home: const CountdownPage(),
    );
  }
}
