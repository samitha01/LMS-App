import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fsyotvrpwricjlbtgtjj.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzeW90dnJwd3JpY2psYnRndGpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzk3Nzg4NDksImV4cCI6MjA5NTM1NDg0OX0.42hb__Nkv8gmh5F0mc3AbRhkZ9_oxe_P6lHUBTw6FZo',
  );

  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS App',

      theme: ThemeData(
        fontFamily: 'Roboto',

        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF3D4FD6),
          background: Color(0xFF1A2252),
          surface: Color(0xFF0F1535),
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1E2D6E),
          prefixIconColor: Color(0xFF6677AA),
          hintStyle: TextStyle(color: Color(0xFF6677AA)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3A4580)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3A4580)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF3D4FD6)),
          ),
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}