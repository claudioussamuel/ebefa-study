import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class ShsDash extends StatelessWidget {
  const ShsDash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.builder(
          itemCount: authController.studentModelShsList.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(authController.studentModelShsList[index].name ?? ''),
              subtitle:
                  Text("${authController.studentModelShsList[index].score}/50"),
            ),
          ),
        ),
      ),
    );
  }
}
