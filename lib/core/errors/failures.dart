abstract class Failure {
  final String error;

  Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);
}
