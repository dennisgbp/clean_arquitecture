import 'package:clean_arquitecture2/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_arquitecture2/features/number_trivia/presentation/controllers/number_trivia_controller.dart';
import 'package:clean_arquitecture2/features/number_trivia/presentation/widgets/loading_widget.dart';
import 'package:clean_arquitecture2/features/number_trivia/presentation/widgets/message_display.dart';
import 'package:clean_arquitecture2/features/number_trivia/presentation/widgets/trivia_controls.dart';
import 'package:clean_arquitecture2/features/number_trivia/presentation/widgets/trivia_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../injection_container.dart';


class NumberTriviaPage extends StatelessWidget {

  late NumberTriviaController _controller;
  //  NumberTriviaController _controller = NumberTriviaController();

  @override
  Widget build(BuildContext context) {
    Get.put(NumberTriviaController(getRandomNumberTrivia: sl(), getConcreteNumberTrivia: sl(), inputConverter: sl()));
    _controller = Get.find<NumberTriviaController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child:
            Center(
                child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 30),
                            // widget con Número y texto
                            TriviaDisplay(
                            ),
                            SizedBox(height: 20),
                            //
                            TriviaControls(),
                          ],
                        ),
                      ),
            ),
        ),
      );
  }

  // BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => sl<NumberTriviaBloc>(),
  //     child: Center(
  //       child: Padding(
  //         padding: const EdgeInsets.all(10),
  //         child: Column(
  //           children: <Widget>[
  //             SizedBox(height: 10),
  //             // Top half
  //             BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
  //               builder: (context, state) {
  //                 if (state is Empty) {
  //                   return MessageDisplay(
  //                     message: 'Start searching!',
  //                   );
  //                 } else if (state is Loaded) {
  //                   return TriviaDisplay(numberTrivia: state.trivia);
  //                 } else if (state is Loading) {
  //                   return LoadingWidget();
  //                 } else if (state is Error) {
  //                   return MessageDisplay(
  //                     message: state.message,
  //                   );
  //                 }
  //                 //return null
  //                 return LoadingWidget();
  //               },
  //             ),
  //             SizedBox(height: 20),
  //             // Bottom half
  //             TriviaControls()
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


}
