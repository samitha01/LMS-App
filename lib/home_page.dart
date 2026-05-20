import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2252),

      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color(0xFF0F1535),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: const Center(
        child: Text(
          "Welcome",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}