import 'package:ebefastudy/constant.dart';
import 'package:ebefastudy/models/Questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  static QuestionController instance = Get.find();
  RxList<RealQuestions> shsQuestions = RxList<RealQuestions>([]);
  RxList<RealQuestions> jhsQuestions = RxList<RealQuestions>([]);

  Rx<bool> isAnswered = false.obs;
  String? correctAns;
  String? selectedAns;
  RxInt questionNumber = 1.obs;
  int numOfCorrectAns = 0;
  var colorGrey = Colors.grey.obs;
  var colorRed = Colors.red.obs;
  var colorGreen = Colors.green.obs;
  RxBool isAClicked = false.obs;
  RxBool isBClicked = false.obs;
  RxBool isCClicked = false.obs;
  RxBool isDClicked = false.obs;

  RxBool makeUnclickA = false.obs;
  RxBool makeUnclickB = false.obs;
  RxBool makeUnclickC = false.obs;
  RxBool makeUnclickD = false.obs;

  PageController pageController = PageController();

  @override
  void onReady() {
    super.onReady();
    shsQuestions.bindStream(getAllShsQuestion());
    jhsQuestions.bindStream(getAllJhsQuestion());
  }

  void checkAnsA(RealQuestions questions) {
    isAnswered.value = true;
    isAClicked.value = true;
    makeUnclickB.value = true;
    makeUnclickC.value = true;
    makeUnclickD.value = true;
    correctAns = questions.correctanswer ?? 'a';
    selectedAns = 'a';
    if (makeUnclickA.value == false) {
      if (correctAns == selectedAns) numOfCorrectAns++;
    }
  }

  void checkAnsB(RealQuestions questions) {
    isAnswered.value = true;
    isBClicked.value = true;

    makeUnclickA.value = true;
    makeUnclickC.value = true;
    makeUnclickD.value = true;

    correctAns = questions.correctanswer ?? 'a';
    selectedAns = 'b';

    if (makeUnclickB.value == false) {
      if (correctAns == selectedAns) numOfCorrectAns++;
    }
  }

  void checkAnsC(RealQuestions questions) {
    isAnswered.value = true;
    isCClicked.value = true;

    makeUnclickA.value = true;
    makeUnclickB.value = true;
    makeUnclickD.value = true;

    correctAns = questions.correctanswer ?? 'a';
    selectedAns = 'c';

    if (makeUnclickC.value == false) {
      if (correctAns == selectedAns) numOfCorrectAns++;
    }
  }

  void checkAnsD(RealQuestions questions) {
    isAnswered.value = true;
    isDClicked.value = true;

    makeUnclickA.value = true;
    makeUnclickB.value = true;
    makeUnclickC.value = true;

    correctAns = questions.correctanswer ?? 'a';
    selectedAns = 'd';

    if (makeUnclickD.value == false) {
      if (correctAns == selectedAns) numOfCorrectAns++;
    }
  }

  Color getTheRightColorA() {
    if (isAnswered.value == true &&
        isAClicked.value == true &&
        makeUnclickA.value == false) {
      if (selectedAns == correctAns) {
        return colorGreen.value;
      } else {
        return colorRed.value;
      }
    }
    return colorGrey.value;
  }

  Color getTheRightColorB() {
    if (isAnswered.value == true &&
        isBClicked.value == true &&
        makeUnclickB.value == false) {
      if (selectedAns == correctAns) {
        return colorGreen.value;
      } else {
        return colorRed.value;
      }
    }
    return colorGrey.value;
  }

  Color getTheRightColorC() {
    if (isAnswered.value == true &&
        isCClicked.value == true &&
        makeUnclickC.value == false) {
      if (selectedAns == correctAns) {
        return colorGreen.value;
      } else {
        return colorRed.value;
      }
    }
    return colorGrey.value;
  }

  Color getTheRightColorD() {
    if (isAnswered.value == true &&
        isDClicked.value == true &&
        makeUnclickD.value == false) {
      if (selectedAns == correctAns) {
        return colorGreen.value;
      } else {
        return colorRed.value;
      }
    }
    return colorGrey.value;
  }

  IconData getTheRightIconA() {
    return getTheRightColorA() == colorRed.value ? Icons.close : Icons.done;
  }

  IconData getTheRightIconB() {
    return getTheRightColorB() == colorRed.value ? Icons.close : Icons.done;
  }

  IconData getTheRightIconC() {
    return getTheRightColorC() == colorRed.value ? Icons.close : Icons.done;
  }

  IconData getTheRightIconD() {
    return getTheRightColorD() == colorRed.value ? Icons.close : Icons.done;
  }

  Stream<List<RealQuestions>> getAllShsQuestion() => firebaseFirestore
      .collection(
        'shsQuestions',
      )
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (e) => RealQuestions.fromMap(
                e.data(),
              ),
            )
            .toList(),
      );
  Stream<List<RealQuestions>> getAllJhsQuestion() => firebaseFirestore
      .collection(
        'jhsQuestions',
      )
      .snapshots()
      .map(
        (event) => event.docs
            .map(
              (e) => RealQuestions.fromMap(
                e.data(),
              ),
            )
            .toList(),
      );
}
