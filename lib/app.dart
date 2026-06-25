import 'package:flutter/material.dart';
import 'package:tv_shows_app/screens/shows_list_screen.dart';
import 'package:tv_shows_app/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TV Shows App',
      theme: AppTheme.lightTheme,
      home: const ShowsListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
