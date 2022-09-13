import 'package:MangoMee/screen/admin/dashboard_screen.dart';
import 'package:MangoMee/screen/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:MangoMee/screen/user/homepage/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  signUp(email, password, name, phone, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;
      final u_id = authCredential!.uid;
      addUser(
          id: u_id, email: email, name: name, password: password, phone: phone);
      if (authCredential.uid.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> admin_check(u_id, is_admin) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('u_id', isEqualTo: u_id)
        .where('is_admin', isEqualTo: is_admin)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }

  signIn(email, password, context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var authCredential = userCredential.user;

      if (authCredential!.uid.isNotEmpty) {
        bool result = await admin_check(authCredential.uid, true);
        if (result == true) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardScreen()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ));
    });
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  //final u_id = authCredential!.uid;
  Future<void> addUser({id, name, email, password, phone}) {
    return users.add({
      'u_id': id,
      'is_admin': false,
      'u_name': name,
      'u_email': email,
      'u_password': password,
      'u_phone_no': phone,
      'u_picture': null
    });
  }
}
