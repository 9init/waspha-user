
import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:waspha/core/base/base_use_case.dart';
import 'package:waspha/src/shared/networking/results.dart';

class ChangeLangUseCase implements BaseUseCase<bool, String> {
  @override
  Future<Either<Failure<dynamic, DioException, Exception>, bool>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
