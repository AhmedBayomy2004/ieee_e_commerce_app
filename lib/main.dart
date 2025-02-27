import 'package:flutter/material.dart';
import 'package:ieee_e_commerce_app/home_screen.dart';
import 'package:ieee_e_commerce_app/providers/theme_provider.dart';
import 'package:ieee_e_commerce_app/search_screen.dart';
import 'package:ieee_e_commerce_app/settings_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), SearchScreen(), SettingScreen()];
  @override
  Widget build(BuildContext context) {
    final currTheme = Provider.of<ThemeProvider>(context).currTheme;
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currTheme,
      home: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings")
            ],
          )),
    );
  }
}
