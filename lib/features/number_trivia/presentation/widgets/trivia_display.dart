import 'package:clean_arquitecture2/features/number_trivia/presentation/controllers/number_trivia_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TriviaDisplay extends StatelessWidget {
  late NumberTriviaController _controller;

   TriviaDisplay({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    _controller = Get.find<NumberTriviaController>();
    return GetBuilder<NumberTriviaController>(
      id: 'result',
      init: _controller,
        builder: (_) {
          if (_.isLoad.value) {
            return const Center(child: CircularProgressIndicator(),);
            } else {
            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 3,
              child: Column(
                children:  [
                  Text(
                    _.numberTrivia!.number.toString(),
                    // numberTrivia.number.toString(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Text(
                           _.numberTrivia!.text,
                          // numberTrivia.text,
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
     );
  }
}
