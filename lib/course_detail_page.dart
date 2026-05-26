import 'package:flutter/material.dart';

class CourseDetailPage extends StatefulWidget {
  final Map<String, dynamic> course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {

  List<bool> completedLessons = [];

  @override
  void initState() {
    super.initState();

    completedLessons = List.generate(5, (index) => false);
  }

  double get progress {
    int done = completedLessons.where((e) => e).length;
    return done / completedLessons.length;
  }

  String get buttonText {
    if (progress == 0) return "Start Course";
    if (progress == 1) return "Completed 🎉";
    return "Continue Learning";
  }

  Color get buttonColor {
    if (progress == 1) return Colors.green;
    if (progress > 0) return Colors.orange;
    return Colors.indigo;
  }

  @override
  Widget build(BuildContext context) {

    final List<String> lessons = [
      "Introduction",
      "Setup Environment",
      "Basic Widgets",
      "Layouts in Flutter",
      "Navigation",
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,

        title: Text(
          widget.course["title"] ?? "Course Details",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // VIDEO
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

            Text(
              widget.course["title"] ?? "No Title",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Instructor: ${widget.course["instructor"] ?? "Unknown"}",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 18),

            Text(
              widget.course["description"] ?? "",
              style: const TextStyle(height: 1.5),
            ),

            const SizedBox(height: 25),

            // PROGRESS BAR (NEW)
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(
                progress == 1 ? Colors.green : Colors.indigo,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "${(progress * 100).toInt()}% completed",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 25),

            const Text(
              "Lessons",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // LESSON LIST (UPDATED)
            Column(
              children: List.generate(lessons.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      completedLessons[index] = !completedLessons[index];
                    });
                  },

                  child: Container(
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

                        Container(
                          height: 45,
                          width: 45,

                          decoration: BoxDecoration(
                            color: completedLessons[index]
                                ? Colors.green.shade100
                                : Colors.indigo.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Icon(
                            completedLessons[index]
                                ? Icons.check
                                : Icons.play_arrow,
                            color: completedLessons[index]
                                ? Colors.green
                                : Colors.indigo,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            lessons[index],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: completedLessons[index]
                                  ? Colors.green
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            // MAIN BUTTON (UPDATED)
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < completedLessons.length; i++) {
                      completedLessons[i] = true;
                    }
                  });
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                child: Text(
                  buttonText,
                  style: const TextStyle(
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