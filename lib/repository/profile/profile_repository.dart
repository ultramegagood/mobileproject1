import 'package:dartz/dartz.dart';
import 'package:mobile_nsk/core/error/exceptions.dart';
import 'package:mobile_nsk/core/error/failures.dart';
import 'package:mobile_nsk/models/profile/user.dart';
import 'package:mobile_nsk/repository/profile/profile_provider.dart';

class ProfileRepository {
  Profileprovider _provider = Profileprovider();
  Future<User> getProfile() async => await _provider.getProfile();
  Future<Either<Failure, void>> deleteAccount(int id) async {
    try {
      await _provider.deleteAccount(id);
      return Right(() {});
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
