import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'controllers/auth_controller.dart';

const double kDefaultPadding = 20.0;
final Future<FirebaseApp> intialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
const kPrimaryColor = Colors.black;
const kPrimaryLightColor = Color.fromARGB(255, 232, 230, 230);
AuthController authController = AuthController.instance;
