import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AuthController/login_screen.dart';
import '../constant.dart';
import '../models/Student.dart';
import '../screens/homepage/home_page.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Opt = TextEditingController();
  var studentModelJhs = StudentModel().obs;
  var studentModelShs = StudentModel().obs;

  var studentModelJhsList = RxList<StudentModel>();
  var studentModelShsList = RxList<StudentModel>();
  Rx<bool> isVisible = true.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);

    studentModelJhsList.bindStream(getJhsUsers());

    studentModelShsList.bindStream(getShsUsers());
  }

  void signOut() async {
    auth.signOut();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      // ===== in case it doesnt work
      studentModelJhs.bindStream(listenToUserJhs());
      studentModelShs.bindStream(listenToUserShs());
      Get.offAll(() => HomePage());
    }
  }

  void signIn() async {
    //showLoading();
    try {
      await auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      Get.offAll(() => HomePage());
      _clearControllers();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Sign In Failed',
        'Try again',
        // snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) {
        String _userId = result.user!.uid;

        // _addUserToFirestore(_userId);
        setUserJhs(StudentModel(
          name: name.text.trim(),
          email: email.text.trim(),
          id: _userId,
        ));
        setUserShs(StudentModel(
          name: name.text.trim(),
          email: email.text.trim(),
          id: _userId,
        ));
        _clearControllers();
      });
      Get.offAll(() => HomePage());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Sign Up Failed',
        'Try again',
        //snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  ///====== getting all the users who
  ///created account name and email

  Stream<StudentModel> listenToUserJhs() => firebaseFirestore
      .collection('studentjhs')
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => StudentModel.fromJson(snapshot));

  //======= Set new user =======
  Future<void> setUserJhs(StudentModel studentModel) {
    return firebaseFirestore
        .collection('studentjhs')
        .doc(studentModel.id)
        .set(studentModel.toMap());
  }

  ///created account name and email

  Stream<StudentModel> listenToUserShs() => firebaseFirestore
      .collection('studentshs')
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((
        snapshot,
      ) =>
          StudentModel.fromJson(
            snapshot,
          ));

  //======= Set new user =======
  Future<void> setUserShs(StudentModel studentModel) {
    return firebaseFirestore
        .collection('studentshs')
        .doc(studentModel.id)
        .set(studentModel.toMap());
  }

  Stream<List<StudentModel>> getJhsUsers() {
    return firebaseFirestore
        .collection(
          'studentjhs',
        )
        .snapshots()
        .map((query) => query.docs
            .map(
              (item) => StudentModel.fromMap(
                item.data(),
              ),
            )
            .toList());
  }

  Stream<List<StudentModel>> getShsUsers() {
    return firebaseFirestore
        .collection(
          'studentshs',
        )
        .snapshots()
        .map((query) => query.docs
            .map(
              (item) => StudentModel.fromMap(
                item.data(),
              ),
            )
            .toList());
  }
}
