import 'package:blogapplication/domain/entities/app_error.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ApiRepository {
  Future<Either<AppError, List<ConfessionEntity>>> getLoveStory();
  Future<Either<AppError, List<ConfessionEntity>>> getFunnyStory();
  Future<Either<AppError, List<ConfessionEntity>>> getconfessionStory();
  Future<Either<AppError, List<ConfessionEntity>>> getrandomStory();
  Future<Either<AppError, List<ConfessionEntity>>> getschoolStory();
  Future<Either<AppError, List<ConfessionEntity>>> getmotivationStory();
  Future<Either<AppError, List<ConfessionEntity>>> getUserStory();
}
