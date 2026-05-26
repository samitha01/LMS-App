import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEditing = false;

  String name = "Samitha Madhushanka";
  String email = "samitha@example.com";
  String studentId = "IS-2021-045";
  String university = "University of Sri Jayewardenepura";
  String faculty = "Computing";
  String degree = "BSc in Information Systems";
  String semester = "Semester 4";
  String phone = "+94 77 123 4567";

  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: name);
    emailCtrl = TextEditingController(text: email);
    phoneCtrl = TextEditingController(text: phone);
  }

  void toggleEdit() {
    setState(() {
      if (isEditing) {
        name = nameCtrl.text;
        email = emailCtrl.text;
        phone = phoneCtrl.text;
      }
      isEditing = !isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: toggleEdit,
            icon: Icon(
              isEditing ? Icons.save : Icons.edit,
              color: Colors.indigo,
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),

        child: Column(
          children: [

            //ANIMATION
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.indigo.shade100,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.indigo,
                    ),
                  ),

                  const SizedBox(height: 15),

                  isEditing
                      ? TextField(controller: nameCtrl)
                      : Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 5),

                  isEditing
                      ? TextField(controller: emailCtrl)
                      : Text(
                    email,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 15),

                  const Divider(),

                  const SizedBox(height: 10),

                  _infoRow("Student ID", studentId),
                  _infoRow("University", university),
                  _infoRow("Faculty", faculty),
                  _infoRow("Degree", degree),
                  _infoRow("Semester", semester),

                  isEditing
                      ? TextField(controller: phoneCtrl)
                      : _infoRow("Phone", phone),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildStatCard("Courses", "8")),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard("Progress", "72%")),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _buildStatCard("Pending", "5 Tasks")),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard("Rank", "#12")),
              ],
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Learning Progress",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 15),

            _buildCourseTile("Flutter Basics - 70%"),
            _buildCourseTile("Dart Fundamentals - 85%"),
            _buildCourseTile("UI Design - 60%"),

            const SizedBox(height: 25),

            CustomButton(
              text: isEditing ? "Save Changes" : "Edit Profile",
              onPressed: toggleEdit,
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () async {
                  final shouldLogout = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Logout"),
                      content: const Text(
                        "Are you sure you want to lpgout?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );

                  if (shouldLogout == true) {
                    await Supabase.instance.client.auth.signOut();

                    if (!mounted) return;

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                          (route) => false,
                    );
                  }
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87)),
        ],
      ),
    );
  }

  static Widget _buildStatCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),
          const SizedBox(height: 5),
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  static Widget _buildCourseTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.trending_up, color: Colors.indigo),
          const SizedBox(width: 12),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87)),
        ],
      ),
    );
  }
}