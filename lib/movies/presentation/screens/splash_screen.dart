import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Navigate'),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MovieScreen(),
              )),
        ),
      ),
    );
  }
}
