import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learnanearnapp/home.dart';
import 'package:learnanearnapp/utils.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfffafafa),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                Hero(
                  tag: "logo",
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                      width: 150,
                    ),
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
                                visualDensity: const VisualDensity(
                                    horizontal: -4, vertical: -4),
                                value: acceptedTnC,
                                onChanged: (v) {
                                  setState(() {
                                    acceptedTnC = v!;
                                  });
                                },
                              ),
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
                                  " t&c.",
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
                                  child: InkWell(
                                    onTap: () {
                                      signInWithGoogle();
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: const Color(0xfff4f4f4),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Image.asset(
                                          "assets/images/google_sign_in_logo.png"),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      signInWithFacebook();
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: const Color(0xfff4f4f4),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Image.asset(
                                          "assets/images/facebook_sign_in_logo.png"),
                                    ),
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
      Utils.showLoadingDialog(context, "Building your career launchpad...");
      print({"email": email,
        "password": confirmPassword,
        "name": name});

      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: confirmPassword,
        );
        if (credential.user != null) {
          await credential.user!.updateDisplayName(name);
          await FirebaseFirestore.instance
              .collection("users")
              .doc(credential.user!.uid)
              .set({
            "email": email,
            "uid": credential.user!.uid,
            "name": name,
            "created": Timestamp.now()
          }).then((v) {
            Navigator.pushAndRemoveUntil(
              context,
              Utils.createRoute(DummyHome(), Utils.DTU),
              (route) => false,
            );
          }, onError: (e) {
            print(e);
            Navigator.pop(context);
            Utils.showdialog(context, "Oh no!!",
                "Something went wrong. Don't Worry! Your account has been created.");
          });
        } else {
          Navigator.pop(context);
          Utils.showdialog(context, "Oh no!!", "Let's try this again.");
        }
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          Utils.showdialog(
              context, "Weak Password", "Please choose a strong password.");
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          Utils.showdialog(
              context, "Email already exists", "Please try another email.");
        } else if (e.code == 'invalid-email') {
          print('Invalid email.');
          Utils.showdialog(
              context, "Email invalid", "Please try another email.");
        } else {
          print('${e.code}: ${e.message}');
          Utils.showdialog(
              context, "Something went wrong.", "Please try again.");
        }
      } catch (e) {
        print(e);
      }
    }
  }

  signInWithGoogle() async {
    try {
      Utils.showLoadingDialog(context, "Signing In...");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final gCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final credential =
          await FirebaseAuth.instance.signInWithCredential(gCredential);

      if (credential.user != null) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .get()
            .then((v) async {
          if (v.exists) {
            Navigator.pushAndRemoveUntil(
              context,
              Utils.createRoute(DummyHome(), Utils.DTU),
              (route) => false,
            );
          } else {
            await FirebaseFirestore.instance
                .collection("users")
                .doc(credential.user!.uid)
                .set(
              {
                "email": credential.user!.email,
                "uid": credential.user!.uid,
                "name": credential.user!.displayName,
                "created": Timestamp.now()
              },
            ).then((v) {
              Navigator.pushAndRemoveUntil(
                context,
                Utils.createRoute(DummyHome(), Utils.DTU),
                (route) => false,
              );
            }, onError: (e) {
              print(e);
              Navigator.pop(context);
              Utils.showdialog(context, "Oh no!!",
                  "Something went wrong. Don't Worry! Your account has been created.");
            });
          }
        });
      } else {
        Navigator.pop(context);
        Utils.showdialog(context, "Oh no!!", "Let's try this again.");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      switch (e.code) {
        case 'invalid-credential':
          print('Error: Invalid credentials');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
          break;
        case 'user-disabled':
          print('Error: User account disabled');
          Utils.showdialog(context, "",
              "Something is wrong with the account. Please try another way.");
          break;
        case 'account-exists-with-different-credential':
          print('Error: Account exists with different credential');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
          break;
        default:
          print('Error: ${e.message}');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error: ${e}');
      Utils.showdialog(context, "", "Something went wrong. Please try again.");
    }
  }

  signInWithFacebook() async {
    try {
      Utils.showLoadingDialog(context, "Signing In...");
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final credential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      if (credential.user != null) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .get()
            .then((v) async {
          if (v.exists) {
            Navigator.pushAndRemoveUntil(
              context,
              Utils.createRoute(DummyHome(), Utils.DTU),
              (route) => false,
            );
          } else {
            await FirebaseFirestore.instance
                .collection("users")
                .doc(credential.user!.uid)
                .set(
              {
                "email": credential.user!.email,
                "uid": credential.user!.uid,
                "name": credential.user!.displayName,
                "created": Timestamp.now()
              },
            ).then((v) {
              Navigator.pushAndRemoveUntil(
                context,
                Utils.createRoute(DummyHome(), Utils.DTU),
                (route) => false,
              );
            }, onError: (e) {
              print(e);
              Navigator.pop(context);
              Utils.showdialog(context, "Oh no!!",
                  "Something went wrong. Don't Worry! Your account has been created.");
            });
          }
        });
      } else {
        Navigator.pop(context);
        Utils.showdialog(context, "Oh no!!", "Let's try this again.");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      switch (e.code) {
        case 'invalid-credential':
          print('Error: Invalid credentials');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
          break;
        case 'user-disabled':
          print('Error: User account disabled');
          Utils.showdialog(context, "",
              "Something is wrong with the account. Please try another way.");
          break;
        case 'account-exists-with-different-credential':
          print('Error: Account exists with different credential');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
          break;
        default:
          print('Error: ${e.message}');
          Utils.showdialog(
              context, "", "Something went wrong. Please try again.");
      }
    } catch (e) {
      Navigator.pop(context);
      print('Error: ${e}');
      Utils.showdialog(context, "", "Something went wrong. Please try again.");
    }
  }
}
