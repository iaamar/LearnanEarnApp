import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:learnanearnapp/signup.dart';
import 'package:learnanearnapp/Home/HomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = "", password = "";
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffafafa),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
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
                          "Sign in your account",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        )),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          hintText: "************",
                          hintStyle: TextStyle(color: Colors.black38),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gapPadding: 0)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffa07bdc),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 64)),
                          onPressed: signIn,
                          child: const Text(
                            "SIGN IN",
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
                          "or sign in with",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                              padding: const EdgeInsets.symmetric(vertical: 8),
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
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ));
                          },
                          child: const Text(
                            " SIGN UP",
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
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      Map signInDetails = {"email": email, "password": password};
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
      print(signInDetails);
    }
  }
}
