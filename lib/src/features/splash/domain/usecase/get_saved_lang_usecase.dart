import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:waspha/core/base/base_use_case.dart';
import 'package:waspha/src/shared/networking/results.dart';

class GetSavedLangUseCase implements BaseUseCase<String?, NoParams> {
  const GetSavedLangUseCase();

  @override
  Future<Either<Failure<dynamic, DioException, Exception>, String?>> call(
      NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
