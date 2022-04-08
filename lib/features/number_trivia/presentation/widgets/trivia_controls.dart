import 'package:clean_arquitecture2/features/number_trivia/presentation/controllers/number_trivia_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TriviaControls extends StatelessWidget {
  //final numberCtrl = TextEditingController();
  String inputStr = '';

  late NumberTriviaController _controller;

  TriviaControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller = Get.find<NumberTriviaController>();
    return GetBuilder<NumberTriviaController>(
      init: _controller,
      builder: (_) {
        return Column(
          children: <Widget>[
            TextField(
              controller: _.numberCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Input a number',
              ),
              onChanged: (value) {
                inputStr = value;
              },
              // onSubmitted: (_) {
              //   // dispatchConcrete();
              // },
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                      child: const Text('Search'),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      textTheme: ButtonTextTheme.primary,
                      onPressed: () {
                        _.LoadNumberConcrete(inputStr);
                        inputStr = '';
                        // print(inputStr);
                      }
                    // dispatchConcrete,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: RaisedButton(
                      child: const Text('Get random trivia'),
                      onPressed: () {
                        _.LoadNumberRandom();
                        inputStr = '';
                      }
                    // dispatchRandom,
                  ),
                ),
              ],
            )
          ],
        );
      }
    );
  }
}




  // final controller = TextEditingController();
  // String inputStr = '';


    // return Column(
    //   children: <Widget>[
    //     TextField(
    //       controller: controller,
    //       keyboardType: TextInputType.number,
    //       decoration: InputDecoration(
    //         border: OutlineInputBorder(),
    //         hintText: 'Input a number',
    //       ),
    //       onChanged: (value) {
    //         inputStr = value;
    //         print(inputStr);
    //       },
    //       onSubmitted: (_) {
    //         dispatchConcrete();
    //       },
    //     ),
    //     SizedBox(height: 10),
    //     Row(
    //       children: <Widget>[
    //         Expanded(
    //           child: RaisedButton(
    //             child: Text('Search'),
    //             color: Theme.of(context).accentColor,
    //             textTheme: ButtonTextTheme.primary,
    //             onPressed: dispatchConcrete,
    //           ),
    //         ),
    //         SizedBox(width: 10),
    //         Expanded(
    //           child: RaisedButton(
    //             child: Text('Get random trivia'),
    //             onPressed: dispatchRandom,
    //           ),
    //         ),
    //       ],
    //     )
    //   ],
    // );


  // void dispatchConcrete() {
  //   controller.clear();
  //   BlocProvider.of<NumberTriviaBloc>(context)
  //       .add(GetTriviaForConcreteNumber(inputStr));
  // }

  // void dispatchRandom() {
  //   controller.clear();
  //   BlocProvider.of<NumberTriviaBloc>(context).add(GetTriviaForRandomNumber());
  //   print(context);
  // }

