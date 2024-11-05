import '../../../data/repository/user_repository.dart';
import '../models/user_model.dart';

class AuthController {
  final UserRepository _userRepository = UserRepository();

  Future<UserModel?> register(String email, String password, String username) {
    return _userRepository.register(email, password, username);
  }

  Future<UserModel?> login(String email, String password) {
    return _userRepository.login(email, password);
  }

  Future<void> logout() {
    return _userRepository.logout();
  }

  Future<UserModel?> signInWithGoogle() {
    return _userRepository.signInWithGoogle();
  }
}
