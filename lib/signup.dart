import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String name = "", email = "", password = "", confirmPassword = "";
  TextEditingController emailController = TextEditingController(),
      nameController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  bool acceptedTnC = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                    width: 200,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Create your account",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Name",
                              style: TextStyle(
                                  color: Color(0xff6f6f6f),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              name = value;
                              return null;
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                hintText: "ex: jon smith",
                                hintStyle: TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gapPadding: 0)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Email",
                              style: TextStyle(
                                  color: Color(0xff6f6f6f),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final RegExp emailRegex =
                                  RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              email = value;
                              return null;
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                hintText: "ex: jon.smith@email.com",
                                hintStyle: TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gapPadding: 0)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Password",
                              style: TextStyle(
                                  color: Color(0xff6f6f6f),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at-least 8 characters.';
                              }
                              password = value;
                              return null;
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                hintText: "************",
                                hintStyle: TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gapPadding: 0)),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text("Confirm password",
                              style: TextStyle(
                                  color: Color(0xff6f6f6f),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: 4,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your confirm password';
                              }
                              if (value != password) {
                                return 'Confirm password must match with the password.';
                              }
                              confirmPassword = value;
                              return null;
                            },
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                hintText: "************",
                                hintStyle: TextStyle(color: Colors.black38),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gapPadding: 0)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  value: acceptedTnC,
                                  onChanged: (v) {
                                    setState(() {
                                      acceptedTnC = true;
                                    });
                                  }),
                              const Text(
                                "I understand the",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {
                                  print("Go To t&c");
                                },
                                child: const Text(
                                  " terms & policy.",
                                  style: TextStyle(
                                      color: Color(0xffB297F7), fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffa07bdc),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 64)),
                                onPressed: signUp,
                                child: const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: Color(0xfffafafa),
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "or sign up with",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14),
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          Hero(
                            tag: "sign methods",
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xfff4f4f4),
                                    ),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Image.asset(
                                        "assets/images/google_sign_in_logo.png"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xfff4f4f4),
                                    ),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Image.asset(
                                        "assets/images/facebook_sign_in_logo.png"),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 42,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: const Color(0xfff4f4f4),
                                    ),
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Image.asset(
                                        "assets/images/apple_sign_in_logo.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an account?",
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  " SIGN IN",
                                  style: TextStyle(
                                      color: Color(0xffB297F7), fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      Map signUpDetails = {
        "email": email,
        "password": confirmPassword,
        "name": name
      };

      print(signUpDetails);
    }
  }
}
