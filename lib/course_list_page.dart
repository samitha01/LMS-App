import 'package:flutter/material.dart';
import 'course_detail_page.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  final List<Map<String, dynamic>> courses = const [
    {
      "title": "Flutter Basics",
      "instructor": "John Doe",
      "description": "Learn Flutter fundamentals and build modern mobile apps.",
    },

    {
      "title": "UI Design Principles",
      "instructor": "Sarah Wilson",
      "description": "Understand clean UI layouts, spacing, and mobile design.",
    },

    {
      "title": "Dart Fundamentals",
      "instructor": "Michael Brown",
      "description": "Master Dart programming language basics and syntax.",
    },

    {
      "title": "Firebase Authentication",
      "instructor": "David Lee",
      "description": "Learn authentication concepts and user login systems.",
    },

    {
      "title": "State Management (Provider)",
      "instructor": "Emma Watson",
      "description": "Manage application state efficiently using Provider.",
    },

    {
      "title": "REST API Basics",
      "instructor": "Chris Evans",
      "description": "Understand API integration and JSON data handling.",
    },

    {
      "title": "Flutter Animations",
      "instructor": "Sophia Miller",
      "description": "Create smooth and interactive mobile animations.",
    },

    {
      "title": "App UI Design Practice",
      "instructor": "Daniel Smith",
      "description": "Practice building responsive and attractive app UIs.",
    },

    {
      "title": "Navigation Deep Dive",
      "instructor": "Olivia Johnson",
      "description": "Learn Flutter navigation and route management.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Courses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(
                    course: course,
                  ),
                ),
              );
            },

            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.play_circle_fill,
                      color: Colors.indigo,
                      size: 34,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course["title"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          course["description"],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Instructor: ${course["instructor"]}",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}