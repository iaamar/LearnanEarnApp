import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class _AIRevampHomePageState extends State<AIRevampHomePage> {
  bool isResumeSelected = false;
  bool isAdvisorSelected = false;
  bool isEnhanceSelected = false;

  void selectOption(String option) {
    setState(() {
      if (option == 'resume') {
        isResumeSelected = true;
        isAdvisorSelected = false;
        isEnhanceSelected = false;
      } else if (option == 'advisor') {
        isResumeSelected = false;
        isAdvisorSelected = true;
        isEnhanceSelected = false;
      } else if (option == 'enhance') {
        isResumeSelected = false;
        isAdvisorSelected = false;
        isEnhanceSelected = true;
      }
    });
  }

  void _pickFile() async {
    FilePickerResult? file = await FilePicker.platform.pickFiles();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Upload resume',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _pickFile();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Drag and Drop or Browse File',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.upload_file, size: 60, color: Colors.black),
                        Text("Limit 200MB - PDF")
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => selectOption('resume'),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: isResumeSelected
                                ? Border.all(
                                    color: const Color(0xFF6A1B9A), width: 1)
                                : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/resume.png',
                              height: 80, width: 80),
                        ),
                        const Text(
                          'Resume \nPolish',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectOption('advisor'),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: isAdvisorSelected
                                ? Border.all(
                                    color: const Color(0xFF6A1B9A), width: 1)
                                : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/advisor.png',
                              height: 80, width: 80),
                        ),
                        const Text(
                          'Talk with \nAdvisor',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectOption('enhance'),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: isEnhanceSelected
                                ? Border.all(
                                    color: const Color(0xFF6A1B9A), width: 1)
                                : null,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/enhance.png',
                              height: 80, width: 80),
                        ),
                        const Text(
                          'Resume \nEnhance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A1B9A),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AIRevampHomePage extends StatefulWidget {
  const AIRevampHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AIRevampHomePageState createState() => _AIRevampHomePageState();
}