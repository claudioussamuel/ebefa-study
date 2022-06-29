import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/questions_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(
      QuestionController(),
    );
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Text(
              'Score',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "${questionController.numOfCorrectAns}/50",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
