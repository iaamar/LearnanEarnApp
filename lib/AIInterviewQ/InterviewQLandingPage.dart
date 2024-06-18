import 'package:flutter/material.dart';
import 'package:learnanearnapp/Styles.dart';

class InterviewQLandingPage extends StatelessWidget {
  const InterviewQLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kTransparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ), // Custom purple color
      ),
      body: SingleChildScrollView(
        child: Container(
          width:
              MediaQuery.of(context).size.width, // Adjust the width as needed
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 131, 98, 215), Color(0xFFA7CCE7)],
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, windowHeight * 0.1 + 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/downloadman.png',
                  // Replace with your image asset path
                  height: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 25),
                const Text(
                  'AI InterviewQ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tailored interview questions using AI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Handle explore button tap
                    print('Explore button tapped');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A), // Custom purple color
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
