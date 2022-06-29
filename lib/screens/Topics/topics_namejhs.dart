import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../jhsQuestion/quize/quiz_screen.dart';

class TopicJhs extends StatelessWidget {
  const TopicJhs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5),
                child: Text("Hello, Claudious Opoku"),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5),
                child: Text(
                  "What Do You Want To Improve Today ?",
                  style: Theme.of(
                    context,
                  ).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding * 0.5),
                child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        // Take you to the main quiz
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  15,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 30,
                                    color: Colors.white60),
                                BoxShadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 30,
                                    color: Colors.white60)
                              ]),
                          child: Row(
                            // I will put the subject picture here
                            children: [
                              Container(
                                width: 90,
                                height: 50,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Int. Science",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Solve random 50 Int. Science\nquestions from 1990 till date\nand see if you will make the\nweekly height scorings board",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.timer_outlined,
                                        size: 30,
                                      ),
                                      Text(
                                        " 60 min",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                      ),
                                      InkWell(
                                        onTap: (() {
                                          Get.to(() => QuizScreen());
                                        }),
                                        child: Icon(
                                          Icons.play_circle_fill_outlined,
                                          size: 50,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
