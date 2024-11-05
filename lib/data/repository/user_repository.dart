import '../../core/services/authentication_service.dart';
import '../../features/auth/models/user_model.dart';

class UserRepository {
  final AuthenticationService _authenticationService = AuthenticationService();

  Future<UserModel?> login(String email, String password) async {
    return _authenticationService.loginUser(email, password);
  }

  Future<UserModel?> register(String email, String password, String username) async {
    return _authenticationService.registerUser(email, password, username);
  }

  Future<void> logout() async {
    await _authenticationService.logoutUser();
  }

  Future<UserModel?> signInWithGoogle() async {
    return _authenticationService.signInWithGoogle();
  }
}
