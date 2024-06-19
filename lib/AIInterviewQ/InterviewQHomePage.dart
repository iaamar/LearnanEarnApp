import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:learnanearnapp/AIInterviewQ/AIInterviewQResultsPage.dart';
import '../Styles.dart';

class InterviewQHomePage extends StatelessWidget {
  void _pickFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(false),
        ), // Custom purple color
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(windowWidth * 0.08, windowWidth * 0.02,
            windowWidth * 0.08, windowWidth * 0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Generate Questions',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer replacement
            GestureDetector(
              onTap: () {
                // Add your code here
                FocusManager.instance.primaryFocus?.unfocus();

                _pickFile();
                print("uploading file...");
              },
              child: Container(
                width: windowWidth,
                height: windowHeight * 0.3,
                decoration: BoxDecoration(
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Upload Resume',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: windowHeight * 0.03),
                    const Icon(Icons.file_upload,
                        color: Colors.black, size: 50),
                    SizedBox(height: windowHeight * 0.03),
                    const Text(
                      "Limit 200MB - PDF",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer replacement
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Enter job description"),
            ),
            const SizedBox(height: 20), // Spacer replacement
            Container(
              height: windowHeight * 0.3, // Fixed height for the TextField
              child: TextField(
                maxLines: (windowHeight * 0.3 / 20).toInt(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Circular border
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Circular border
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  filled: true,
                  fillColor: const Color(0xFFECECEC),
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Spacer replacement
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => AIInterviewQResultsPage()));
              },
              child: Container(
                width: windowWidth,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                      'Generate',
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
    );
  }
}
