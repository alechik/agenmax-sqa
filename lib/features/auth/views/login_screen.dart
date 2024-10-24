import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController _authController = AuthController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Cambia el color del fondo a blanco
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              // Permite desplazamiento si es necesario
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  SizedBox(
                    width: 100, // Ajusta el tamaño según sea necesario
                    height: 100,
                    child: Image.asset(
                        'assets/logo.png'), // Asegúrate de tener el logo en la carpeta assets
                  ),
                  SizedBox(height: 10),
                  Text(
                    'AgenMax', // Texto debajo del logo
                    style: TextStyle(
                      fontSize: 24, // Tamaño del texto
                      fontWeight: FontWeight.bold, // Estilo negrita
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email', // Cambiado a hintText
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password', // Cambiado a hintText
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  // Botón Iniciar Sesión
                  SizedBox(
                    width: double
                        .infinity, // Hace que el botón ocupe todo el ancho disponible
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.deepPurpleAccent, // Color del botón
                        padding: EdgeInsets.symmetric(
                            vertical: 15), // Ajustar el padding vertical
                      ),
                      onPressed: () async {
                        var user = await _authController.login(
                          emailController.text,
                          passwordController.text,
                        );
                        if (user != null) {
                          // Navegar a la pantalla principal
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          // Mostrar un mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error al iniciar sesión')),
                          );
                        }
                      },
                      child: Text(
                        'Login',
                        style:
                            TextStyle(color: Colors.white), // Texto en blanco
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Botón Registrarse
                  SizedBox(
                    width: double
                        .infinity, // Hace que el botón ocupe todo el ancho disponible
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        side: BorderSide(color: Colors.black), // Borde negro
                        backgroundColor: Colors.white, // Color del fondo
                      ),
                      onPressed: () {
                        // Navegar a la pantalla de registro
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Register'), // Texto del botón
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
