import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> lessons = [
      "Introduction",
      "Setup Environment",
      "Basic Widgets",
      "Layouts in Flutter",
      "Navigation",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,

        title: Text(
          course["title"] ?? "Course Details",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // VIDEO PLACEHOLDER
            Container(
              height: 220,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  size: 70,
                  color: Colors.indigo,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // COURSE TITLE
            Text(
              course["title"] ?? "No Title",

              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 10),

            // INSTRUCTOR
            Text(
              "Instructor: ${course["instructor"] ?? "Unknown"}",

              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 18),

            // DESCRIPTION
            Text(
              course["description"] ??
                  "No description available for this course.",

              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 30),

            // LESSON TITLE
            const Text(
              "Lessons",

              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 15),

            // LESSON LIST
            Column(
              children: lessons.map((lesson) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 8,
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // ICON BOX
                      Container(
                        height: 45,
                        width: 45,

                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.indigo,
                        ),
                      ),

                      const SizedBox(width: 14),

                      // LESSON TEXT
                      Expanded(
                        child: Text(
                          lesson,

                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            // COMPLETE BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                child: const Text(
                  "Complete Lesson",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}