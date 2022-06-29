import 'package:ebefastudy/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JhsDash extends StatelessWidget {
  const JhsDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: authController.studentModelJhsList.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(authController.studentModelJhsList[index].name ?? ''),
              subtitle:
                  Text("${authController.studentModelJhsList[index].score}/50"),
            ),
          ),
        ),
      ),
    );
  }
}
