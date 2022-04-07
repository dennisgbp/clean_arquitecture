import 'package:clean_arquitecture2/core/error/failures.dart';
import 'package:clean_arquitecture2/core/usecases/usecase.dart';
import 'package:clean_arquitecture2/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/number_trivia.dart';



class GetRandomNumberTrivia implements UseCaseWithoutParams<NumberTrivia> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call() async {
    return await repository.getRandomNumberTrivia();
  }
}
