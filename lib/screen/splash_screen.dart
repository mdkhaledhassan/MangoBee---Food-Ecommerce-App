import 'dart:async';

import 'package:MangoMee/screen/user/homepage/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:MangoMee/screen/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => user == null ? SignInScreen() : Homepage()));
    });
    return Scaffold(
      backgroundColor: Color(0xffF3F5F7),
      body: Center(
        child: Image.asset('assets/images/Splash-logo.png'),
      ),
    );
  }
}
