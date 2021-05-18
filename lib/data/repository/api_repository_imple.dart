import 'dart:async';
import 'dart:io';

import 'package:blogapplication/data/models/confessions.dart';
import 'package:blogapplication/data/network/services.dart';
import 'package:blogapplication/domain/entities/app_error.dart';
import 'package:blogapplication/domain/repository/api_repository.dart';
import 'package:dartz/dartz.dart';

class ApiRepositoryImpl extends ApiRepository {
  final RemoteDataSource remoteDataSource;

  ApiRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError, List<Confessions>>> getLoveStory() async {
    try {
      final confesions = await remoteDataSource.getLoveStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getFunnyStory() async {
    try {
      final confesions = await remoteDataSource.getFunnyStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getconfessionStory() async {
    try {
      final confesions = await remoteDataSource.getconfessionStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getrandomStory() async {
    try {
      final confesions = await remoteDataSource.getrandomStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getschoolStory() async {
    try {
      final confesions = await remoteDataSource.getschoolStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getmotivationStory() async {
    try {
      final confesions = await remoteDataSource.getmotivationStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }

  @override
  Future<Either<AppError, List<Confessions>>> getUserStory() async {
    try {
      final confesions = await remoteDataSource.getUserStory();
      return Right(confesions);
    } on SocketException {
      return Left(AppError(AppErrprType.network));
    } on Exception {
      return Left(AppError(AppErrprType.api));
    }
  }
}
