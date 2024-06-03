import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_managment/data/models/auth_model.dart';
import 'package:school_managment/data/models/auth_response.dart';
import 'package:school_managment/data/repositories/auth.repo.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authenticationRepository;

  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        final AuthResponse authResponse = await authenticationRepository.login(
            AuthModel(usernameOrEmail: event.email, password: event.password));
        final token = authResponse.accessToken;
        emit(Authenticated(token: token ?? ''));
      } catch (e) {
        emit(const AuthenticationFailure(message: 'Failed to log in'));
      }
    });

    on<LogoutRequested>((event, emit) {
      authenticationRepository.logout();
      emit(Unauthenticated());
    });
  }
}

// @override
// Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
//   if (event is LoginRequested) {
//     try {
//       final response = await http.post(
//         Uri.parse('YOUR_API_LOGIN_ENDPOINT'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(<String, String>{
//           'email': event.email,
//           'password': event.password,
//         }),
//       );
//
//       if (response.statusCode == 200) {
//         final responseBody = jsonDecode(response.body);
//         yield Authenticated(token: responseBody['token']);
//       } else {
//         yield const AuthenticationFailure(message: 'Failed to authenticate.');
//       }
//     } catch (_) {
//       yield const AuthenticationFailure(message: 'An error occurred during authentication.');
//     }
//   } else if (event is LogoutRequested) {
//     // Implement logout logic here
//     yield Unauthenticated();
//   }
// }
