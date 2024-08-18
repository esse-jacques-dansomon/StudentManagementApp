
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/models/auth_response.dart';

import '../../../../utils/SecureStorage.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SecureStorage secureStorage;

  AuthenticationBloc({required this.secureStorage})
      : super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    try {
      final bool hasToken = await secureStorage.hasToken();
      final AuthResponse? authResponse = await secureStorage.getUser();
      if (hasToken && authResponse != null) {
        emit(AuthenticationAuthenticated(authResponse: authResponse));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    } on Exception catch (e) {
      emit(AuthenticationUnauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    try {
      emit(AuthenticationLoading());
      await secureStorage.persistUserAndToken(event.authResponse, event.token);
      emit(AuthenticationAuthenticated(authResponse: event.authResponse));
    } catch (e) {
      emit(AuthenticationUnauthenticated());
    }
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await secureStorage.deleteToken();
    emit(AuthenticationUnauthenticated());
    print("unauthenticated");
  }
}

