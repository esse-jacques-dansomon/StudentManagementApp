part of 'auth_bloc.dart';



abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent{
  final String token;
  final AuthResponse authResponse;

  const LoggedIn({required this.token, required this.authResponse});

  @override
  List<Object> get props => [token];
}

class LoggedOut extends AuthenticationEvent {}
