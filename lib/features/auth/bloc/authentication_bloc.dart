import 'package:bloc/bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield AuthenticationLoading();
      // Lógica para verificar el estado de autenticación
      // Ejemplo: Verificar si el usuario está autenticado
      // if (isLoggedIn) yield AuthenticationAuthenticated();
      // else yield AuthenticationUnauthenticated();
    } else if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    } else if (event is LoggedOut) {
      yield AuthenticationUnauthenticated();
    }
  }
}
