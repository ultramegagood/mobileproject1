abstract class Failure {
  String? message;
  Failure({this.message});
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message: message);
}
// class CacheFailure extends Failure {}