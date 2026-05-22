import 'package:flutter/material.dart';
import 'login_page.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A2252),

      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                OnboardPage(
                  title: "Learn Anywhere",
                  desc: "Access your LMS anytime, anywhere.",
                  icon: Icons.phone_android,
                ),
                OnboardPage(
                  title: "Track Progress",
                  desc: "Monitor your learning journey easily.",
                  icon: Icons.bar_chart,
                ),
                OnboardPage(
                  title: "Achieve Goals",
                  desc: "Complete courses and grow your skills.",
                  icon: Icons.emoji_events,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: currentIndex == index ? 18 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xFF3D4FD6)
                            : const Color(0xFF6677AA),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),

                ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D4FD6),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    currentIndex == 2 ? "Start" : "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;

  const OnboardPage({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: const Color(0xFF3D4FD6)),
          const SizedBox(height: 30),

          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF8899CC),
            ),
          ),
        ],
      ),
    );
  }
}