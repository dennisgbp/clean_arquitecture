import 'dart:developer';

import 'package:clean_arquitecture2/core/error/failures.dart';
import 'package:clean_arquitecture2/core/util/input_converter.dart';
import 'package:clean_arquitecture2/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_arquitecture2/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:clean_arquitecture2/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaController extends GetxController {
  final GetConcreteNumberTrivia _getConcreteNumberTrivia;
  final GetRandomNumberTrivia _getRandomNumberTrivia;
  final InputConverter _inputConverter;

  final numberCtrl = TextEditingController();
  RxBool isLoad = false.obs;

  NumberTrivia? numberTrivia;

  NumberTriviaController({
    required GetRandomNumberTrivia getRandomNumberTrivia,
    required GetConcreteNumberTrivia getConcreteNumberTrivia,
    required InputConverter inputConverter,
  })  : _getRandomNumberTrivia = getRandomNumberTrivia,
        _getConcreteNumberTrivia = getConcreteNumberTrivia,
        _inputConverter = inputConverter;


  @override
  void onReady() {
    LoadNumberConcrete(numberTrivia!.number.toString());
    LoadNumberRandom();
    super.onReady();
  }

  void LoadNumberConcrete(String numberString) async {
    print(numberString);
    this.isLoad.value = true;
    //final inputEither = _inputConverter.stringToUnsignedInteger(numberString);
    var integer = int.parse(numberString);
    final res = await _getConcreteNumberTrivia(Params(number: integer));

    res.fold((l) {
      log("$l", name: "Error");
      this.isLoad.value = false;
    }, (r) {
      this.numberTrivia =  r;
      this.isLoad.value = false;
      update(['result']);
    });
  }

  void LoadNumberRandom() async {
    this.isLoad.value = true;
    final res = await _getRandomNumberTrivia();

    res.fold((l) {
      log("$l", name: "Error");
      this.isLoad.value = false;
    }, (r) {
      this.numberTrivia =  r;
      this.isLoad.value = false;
      update(['result']);
    });
      print(numberTrivia!.number);
  }

// String _mapFailureToMessage(Failure failure) {
//   switch (failure.runtimeType) {
//     case ServerFailure:
//       return SERVER_FAILURE_MESSAGE;
//     case CacheFailure:
//       return CACHE_FAILURE_MESSAGE;
//     default:
//       return 'Unexpected error';
//   }
// }

}
