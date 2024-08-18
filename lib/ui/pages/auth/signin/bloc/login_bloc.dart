import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/models/auth_model.dart';
import 'package:school_managment/data/models/student.model.dart';

import '../../../../../data/repositories/auth.repo.dart';
import '../../bloc/auth_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authenticationRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.authenticationRepository,
    required this.authenticationBloc}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(LoginButtonPressed event,
      Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final authResponse = await authenticationRepository.login(
          AuthModel(usernameOrEmail: event.username, password: event.password)
      );
      authenticationBloc.add(LoggedIn(token: authResponse.accessToken, authResponse:authResponse ));

      final student = await authenticationRepository.getStudent();
      emit(LoginSuccess());
      emit(LoginInitial());
    } catch(error) {
    emit(LoginFailure(error: error.toString()));
    }
  }
}