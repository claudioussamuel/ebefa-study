import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant.dart';

import '../../../controllers/questions_controller.dart';
import '../../../models/Questions.dart';

class QuestionsCard extends StatefulWidget {
  final RealQuestions questions;
  const QuestionsCard({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuestionsCard> createState() => _QuestionsCardState();
}

class _QuestionsCardState extends State<QuestionsCard> {
  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(
      QuestionController(),
    );
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.5, vertical: kDefaultPadding * 0.5),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          kDefaultPadding,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              widget.questions.text ?? " ",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {
                if (questionController.isAnswered.value == false) {
                  questionController.checkAnsA(widget.questions);
                } else {
                  null;
                }
              },
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: questionController.getTheRightColorA(),
                    ),
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.questions.a ?? "",
                          style: TextStyle(
                            color: questionController.getTheRightColorA(),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: questionController.getTheRightColorA() ==
                                    Colors.grey
                                ? Colors.transparent
                                : questionController.getTheRightColorA(),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: questionController.getTheRightColorA(),
                            ),
                          ),
                          child: questionController.getTheRightIconA() ==
                                  Colors.grey
                              ? null
                              : Icon(
                                  questionController.getTheRightIconA(),
                                  color: Colors.white,
                                ))
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (questionController.isAnswered.value == false) {
                  questionController.checkAnsB(widget.questions);
                } else {
                  null;
                }
              },
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: questionController.getTheRightColorB(),
                    ),
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.questions.b ?? "",
                          style: TextStyle(
                            color: questionController.getTheRightColorB(),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: questionController.getTheRightColorB() ==
                                    Colors.grey
                                ? Colors.transparent
                                : questionController.getTheRightColorB(),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: questionController.getTheRightColorB(),
                            ),
                          ),
                          child: questionController.getTheRightIconB() ==
                                  Colors.grey
                              ? null
                              : Icon(
                                  questionController.getTheRightIconB(),
                                  color: Colors.white,
                                ))
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (questionController.isAnswered.value == false) {
                  questionController.checkAnsC(widget.questions);
                } else {
                  null;
                }
              },
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: questionController.getTheRightColorC(),
                    ),
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.questions.c ?? "",
                          style: TextStyle(
                            color: questionController.getTheRightColorC(),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: questionController.getTheRightColorC() ==
                                  Colors.grey
                              ? Colors.transparent
                              : questionController.getTheRightColorC(),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: questionController.getTheRightColorC(),
                          ),
                        ),
                        child:
                            questionController.getTheRightIconC() == Colors.grey
                                ? null
                                : Icon(
                                    questionController.getTheRightIconC(),
                                    color: Colors.white,
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (questionController.isAnswered.value == false) {
                  questionController.checkAnsD(widget.questions);
                } else {
                  null;
                }
              },
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  padding: EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: questionController.getTheRightColorD(),
                    ),
                    borderRadius: BorderRadius.circular(kDefaultPadding),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.questions.d ?? "",
                          style: TextStyle(
                            color: questionController.getTheRightColorD(),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: questionController.getTheRightColorD() ==
                                  Colors.grey
                              ? Colors.transparent
                              : questionController.getTheRightColorD(),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: questionController.getTheRightColorD(),
                          ),
                        ),
                        child:
                            questionController.getTheRightIconD == Colors.grey
                                ? null
                                : Icon(
                                    questionController.getTheRightIconD(),
                                    color: Colors.white,
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
