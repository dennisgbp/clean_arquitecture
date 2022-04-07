
import 'package:clean_arquitecture2/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String str){
    try{
      final integer = int.parse(str);
      if(integer < 0) throw FormatException();
      return Right(integer);
    }on FormatException{
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}