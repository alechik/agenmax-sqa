import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/auth/models/user_model.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
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
        await firebaseUser.updateDisplayName(username);

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

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // El usuario canceló el inicio de sesión

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      User? firebaseUser = userCredential.user;

      return firebaseUser != null
          ? UserModel(
              idUser: firebaseUser.uid,
              username: firebaseUser.displayName ?? 'Google User',
              email: firebaseUser.email ?? '',
            )
          : null;
    } catch (e) {
      print("Error al iniciar sesión con Google: $e");
      return null;
    }
  }
}
