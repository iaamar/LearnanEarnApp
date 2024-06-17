import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:learnanearnapp/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnanearnapp/utils.dart';
import 'firebase_options.dart';
import 'home.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'LearnAnEarn',
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        opacity = 1;
        timer.cancel();
        Timer.periodic(const Duration(milliseconds: 1500), (_timer) {
          _checkAuth();
          _timer.cancel();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: Center(
        child: Hero(
          tag: "logo",
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            opacity: opacity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 36),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkAuth() async {
    await FirebaseAuth.instance.signOut();
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacement(
          context, Utils.createRoute(const SignInPage(), Utils.DTU));
    } else {
      Navigator.push(context, Utils.createRoute(DummyHome(), Utils.DTU));
    }
  }
}

