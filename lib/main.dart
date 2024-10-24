import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'features/auth/views/login_screen.dart';
import 'features/auth/views/register_screen.dart'; // Importa la pantalla de registro
import 'features/auth/views/home_screen.dart'; // Asegúrate de importar la pantalla de inicio
import 'firebase_options.dart'; // Archivo de opciones generado por FlutterFire

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // FirebaseOptions para web/móvil
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => LoginScreen(), // Pantalla de inicio de sesión
        '/register': (context) => RegisterScreen(), // Ruta para la pantalla de registro
        '/home': (context) => HomeScreen(), // Ruta para la pantalla principal
      },
    );
  }
}
