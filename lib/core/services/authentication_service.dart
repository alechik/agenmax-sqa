import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/models/user_model.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Crear un UserModel a partir de la información del usuario
        return UserModel(
          idUser: firebaseUser.uid,
          username: firebaseUser.displayName ?? 'Usuario',
          email: firebaseUser.email ?? '',
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error en el inicio de sesión: $e');
      return null;
    }
  }

  Future<UserModel?> registerUser(String email, String password, String username) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        // Actualiza el displayName
        await firebaseUser.updateDisplayName(username);

        // Crear un UserModel a partir de la información del usuario
        return UserModel(
          idUser: firebaseUser.uid,
          username: username,
          email: firebaseUser.email ?? '',
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error en el registro: $e');
      return null;
    }
  }

  Future<void> logoutUser() async {
    await _firebaseAuth.signOut();
  }
}
