import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Nombre de Usuario'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var user = await _authController.register(
                  emailController.text,
                  passwordController.text,
                  usernameController.text,
                );
                if (user != null) {
                  // Navegar a la pantalla principal
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Mostrar un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al registrar usuario')),
                  );
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
