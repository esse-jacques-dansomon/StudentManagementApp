part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {

  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final AuthResponse authResponse;

  const AuthenticationAuthenticated({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}
