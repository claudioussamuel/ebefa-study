import 'package:ebefastudy/constant.dart';
import 'package:ebefastudy/screens/ShsHomeScreen/shs_homeScreen.dart';
import 'package:ebefastudy/screens/jhsHomeScreen/jhs_homeScreen.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 2,
              ),
              Text(
                "Let's Solve Passco",
                style: Theme.of(
                  context,
                ).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text("Select your education level"),
              Spacer(),
              GestureDetector(
                onTap: (() {
                  Get.to(() => ShsHomeScreen());
                }),
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
                  child: Text(
                    "Senior High School",
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (() {
                  Get.to(() => JhsHomeScreen());
                }),
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
                  child: Text(
                    "Junior High School",
                    style: Theme.of(context).textTheme.button!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
