import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mobile_nsk/core/error/exceptions.dart';
import 'package:mobile_nsk/core/error/failures.dart';
import 'package:mobile_nsk/main.dart';
import 'package:mobile_nsk/models/tourism/get_full_client_response.dart';
import 'package:mobile_nsk/models/tourism/set_full_client_request.dart';
import 'package:mobile_nsk/models/tourism/tourism_model.dart';
import 'package:mobile_nsk/repository/calculator/tourism/tourism_provider.dart';

class TourismRepository {
  final TourismProvider provider = TourismProvider();
  Future getRecources() => provider.getInsuranceRecources();

  Future<Either<Failure, GetFullClientResponse>> getFullClient(
      String value) async {
    try {
      final response = await provider.getFullClient(value);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, int>> setFullClient(
      SetFullClientRequest client) async {
    try {
      final response = await provider.setFullClient(client);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  Future<Either<Failure, int>> writeHealth(String email) async {
    try {
      final model = await box.read<TourismModel>('calculatedTourism');
      model!.email = email;
      final response = await provider.writeHealth(model);
      return Right(response);
    } on ServerException catch (e) {
      log('Server exception: ${e.message}');
      return Left(ServerFailure(e.message));
    }
  }
}
