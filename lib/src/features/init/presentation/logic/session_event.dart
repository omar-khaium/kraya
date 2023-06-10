part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class TapSession extends SessionEvent {}

class LoginEvent extends SessionEvent {}

class LogoutEvent extends SessionEvent {}
