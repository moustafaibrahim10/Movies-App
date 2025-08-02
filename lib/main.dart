import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';
import 'package:movies_app/modules/movies/domain/entites/movie.dart';
import 'package:movies_app/modules/movies/presentaion/screens/movies_screen.dart';
import 'package:movies_app/test.dart';

import 'core/utils/app_strings.dart';

void main() {
  ServerLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: MoviesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
