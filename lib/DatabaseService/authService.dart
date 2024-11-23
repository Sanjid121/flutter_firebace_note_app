import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebace1/view/home/Home_v2.dart';
import 'package:flutter_firebace1/view/home/Note_home_page.dart';


class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future Signup(String email, String password) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user;
  }

  Future<UserCredential> Signin(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future Signout() async {
    await auth.signOut();
  }

  Future AuthDataSave(Map<String, dynamic> data, BuildContext ctx) async {
    await db.collection('users').doc().set(data);
    Navigator.push(ctx, MaterialPageRoute(builder: (_) => HomePage()));
  }
}
