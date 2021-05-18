import 'package:blogapplication/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';


abstract class UseCase<T , Params>{
  Future<Either<AppError , T>> call(Params params);
}