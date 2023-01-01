import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([String? message]);
}

class InteretDisconnectedFailure extends Failure {
  InteretDisconnectedFailure() : super();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure([String? message]) : super(message);

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  CacheFailure([String? message]) : super(message);

  @override
  List<Object?> get props => [];
}

class ProfileNotFoundFailure extends Failure {
  ProfileNotFoundFailure([String? message]) : super(message);

  @override
  List<Object?> get props => [];
}
