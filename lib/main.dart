import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_page.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LMS Login',
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;

  void login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  void forgotPassword() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Forgot password clicked")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2252),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _desktopLayout();
          } else {
            return _mobileLayout();
          }
        },
      ),
    );
  }

  // ---------------- DESKTOP SPLIT ----------------
  Widget _desktopLayout() {
    return Row(
      children: [
        // LEFT IMAGE SIDE
        Expanded(
          child: Container(
            color: const Color(0xFF0F1535),
            child: Center(
              child: SvgPicture.asset(
                'assets/lms_cartoon_illustration.svg',
                height: 320,
              ),
            ),
          ),
        ),

        // RIGHT LOGIN SIDE
        Expanded(child: Center(child: _loginBox())),
      ],
    );
  }

  // ---------------- MOBILE ----------------
  Widget _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            color: const Color(0xFF0F1535),
            child: Center(
              child: SvgPicture.asset(
                'assets/lms_cartoon_illustration.svg',
                height: 180,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _loginBox(),
        ],
      ),
    );
  }

  // ---------------- LOGIN BOX ----------------
  Widget _loginBox() {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1535),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SMALL LOGO
          SvgPicture.asset('assets/lms_university_logo.svg', height: 60),

          const SizedBox(height: 10),

          const Text(
            "LMS Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Form(
            key: _formKey,
            child: Column(
              children: [
                // EMAIL
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration("Email", Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                // PASSWORD
                TextFormField(
                  controller: passwordController,
                  obscureText: obscurePassword,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputDecoration("Password", Icons.lock).copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      icon: Icon(
                        obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF6677AA),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: forgotPassword,
              child: const Text(
                "Forgot password?",
                style: TextStyle(color: Color(0xFF8899CC)),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // LOGIN BUTTON
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3D4FD6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- INPUT STYLE ----------------
  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF6677AA)),
      prefixIcon: Icon(icon, color: const Color(0xFF6677AA)),
      filled: true,
      fillColor: const Color(0xFF1E2D6E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF3A4580)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF3A4580)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF3D4FD6)),
      ),
    );
  }
}
