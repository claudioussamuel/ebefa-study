import 'package:ebefastudy/models/Questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant.dart';
import '../../../controllers/questions_controller.dart';
import 'progress_bar.dart';
import 'questions_card.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(
      QuestionController(),
    );
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Text.rich(
                TextSpan(
                  text: "Question ${questionController.questionNumber.value}",
                  style: TextStyle(fontSize: 20),
                  children: [
                    TextSpan(
                      text: "/50",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Expanded(
              child: Obx(
                () => PageView(
                  controller: questionController.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    questionController.questionNumber.value = (value + 1);

                    questionController.isAClicked.value = false;
                    questionController.isBClicked.value = false;
                    questionController.isCClicked.value = false;
                    questionController.isDClicked.value = false;

                    questionController.isAnswered.value = false;

                    questionController.makeUnclickA.value = false;
                    questionController.makeUnclickB.value = false;
                    questionController.makeUnclickC.value = false;
                    questionController.makeUnclickD.value = false;
                  },
                  children: questionController.jhsQuestions
                      .map(
                        (RealQuestions questions) => QuestionsCard(
                          questions: questions,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
