import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

import '../../controllers/questions_controller.dart';
import '../../models/Student.dart';
import '../../screens/score/score_screen.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(
      QuestionController(),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => ScoreScreen());
                authController.setUserShs(
                  StudentModel(
                    score: questionController.numOfCorrectAns,
                    name: authController.studentModelShs.value.name ?? "",
                    id: authController.studentModelShs.value.id ?? "",
                    email: authController.studentModelShs.value.email ?? "",
                  ),
                );
              },
              child: Text(
                "Exit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward_ios,
        ),
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        onPressed: () {
          questionController.pageController.nextPage(
              duration: Duration(milliseconds: 250), curve: Curves.ease);
        },
      ),
    );
  }
}
