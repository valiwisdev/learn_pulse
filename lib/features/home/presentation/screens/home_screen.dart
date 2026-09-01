import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Home Screen',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.home, size: 80, color: Colors.deepPurple),
          ],
        ),
      )
    );
  }
}
