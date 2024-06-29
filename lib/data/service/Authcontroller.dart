//import 'package:exploreandtrip/Constant/Connect.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/constant/Connect.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<UserCredential?> LoginUser({context}) async {
    UserCredential? userCre;

    try {
      userCre = await firebase_auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {

    }
    return userCre;
  }

  Logout(context) async {
    try {
      await firebase_auth.signOut();
    } catch (e) {

    }
  }

  Future<UserCredential?> RegiterUser({email, password, context}) async {
    UserCredential? userCren;
    try {
      userCren = await firebase_auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {

    }
    return userCren;
  }
}
