import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../../../controllers/counter_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    * @Use
    */
    final CounterState counterState = Get.put(CounterState());
    counterState.startTimer();
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(
          50,
        ),
      ),
      child: GetBuilder<CounterState>(
          init: CounterState(),
          builder: (
            controller,
          ) {
            return Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * (controller.count / 60),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(
                        238,
                        7,
                        23,
                        71,
                      ),
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '60 min',
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
