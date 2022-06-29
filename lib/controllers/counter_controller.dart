import 'dart:async';
import 'package:ebefastudy/controllers/questions_controller.dart';
import 'package:ebefastudy/screens/score/score_screen.dart';
import 'package:get/get.dart';

import '../constant.dart';
import '../models/Student.dart';

class CounterState extends GetxController {
  var count = 0;
  late Timer _timer;

  var questionController = Get.put(QuestionController());

  void startTimer() {
    _timer = Timer.periodic(
        const Duration(
          seconds: 60,
        ), (timer) {
      if (count < 60) {
        count++;
        update();
      } else {
        timer.cancel();
        update();
        Get.to(() => ScoreScreen());

        authController.setUserJhs(
          StudentModel(
            score: questionController.numOfCorrectAns,
            name: authController.studentModelJhs.value.name ?? "",
            id: authController.studentModelJhs.value.id ?? "",
            email: authController.studentModelJhs.value.email ?? "",
          ),
        );

        authController.setUserShs(
          StudentModel(
            score: questionController.numOfCorrectAns,
            name: authController.studentModelShs.value.name ?? "",
            id: authController.studentModelShs.value.id ?? "",
            email: authController.studentModelShs.value.email ?? "",
          ),
        );
      }
    });
  }
}
