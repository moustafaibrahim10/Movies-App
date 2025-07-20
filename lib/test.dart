import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/presentaion/screens/movies_screen.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoviesScreen()),
            );
          },
          child: Text("Navigator"),
        ),
      ),
    );
  }
}
