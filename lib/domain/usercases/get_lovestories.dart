import 'package:blogapplication/domain/entities/app_error.dart';
import 'package:blogapplication/domain/entities/confession_entity.dart';
import 'package:blogapplication/domain/entities/no_params.dart';
import 'package:blogapplication/domain/repository/api_repository.dart';
import 'package:blogapplication/domain/usercases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetLoveStory extends UseCase<List<ConfessionEntity>, NoParams> {
  final ApiRepository apiRepository;

  GetLoveStory(this.apiRepository);

  @override
  Future<Either<AppError, List<ConfessionEntity>>> call(NoParams params) {
    return apiRepository.getLoveStory();
  }
}
