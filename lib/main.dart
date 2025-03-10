import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/screens/signup_screen.dart';
import 'package:ieee_e_commerce_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currTheme = Provider.of<ThemeProvider>(context).currTheme;
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currTheme,
      home: Scaffold(
        body: SignUp(),
      ),
    );
  }
}
