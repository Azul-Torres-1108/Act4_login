import 'package:flutter/material.dart';

void main() => runApp(const ZulyPaintApp());

class ZulyPaintApp extends StatelessWidget {
  const ZulyPaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  bool acceptTerms = false;

  InputDecoration customInputDecoration(String label, Icon icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.blueGrey, fontFamily: 'Italiana'),
      prefixIcon: icon,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget buildTextField({
    required String label,
    required bool obscureText,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2))
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: customInputDecoration(label, prefixIcon)
            .copyWith(suffixIcon: suffixIcon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'ZulyPaint',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Italiana',
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 10),
            // Stack para combinar iconos
            Stack(
              alignment: Alignment.center,
              children: const [
                Icon(Icons.palette, size: 28, color: Colors.blue),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Icon(Icons.brush, size: 16, color: Colors.blueAccent),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 26, fontFamily: 'Italiana'),
              ),
              const SizedBox(height: 30),

              // Contenedor principal
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xff124882),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Botón Google con imagen
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/logogoogle.png',
                              width: 24, height: 24),
                          const SizedBox(width: 10),
                          const Text(
                            'Iniciar Sesión con Google',
                            style: TextStyle(fontFamily: 'Arial'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 10),

                    // Campos Gmail y Contraseña
                    buildTextField(
                      label: 'Correo electrónico',
                      controller: emailController,
                      obscureText: false,
                      prefixIcon: const Icon(Icons.email),
                      validator: (v) =>
                          (v == null || v.isEmpty) ? 'Obligatorio' : null,
                      suffixIcon: null,
                    ),
                    buildTextField(
                      label: 'Contraseña',
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () => setState(
                            () => _isPasswordVisible = !_isPasswordVisible),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Obligatorio';
                        if (v.length < 6) return 'Mínimo 6 caracteres';
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                      value: acceptTerms,
                      onChanged: (v) => setState(() => acceptTerms = v!)),
                  const Expanded(
                    child: Text(
                      'Aceptas todos los Términos y Condiciones',
                      style: TextStyle(fontSize: 16, fontFamily: 'Italiana'),
                    ),
                  ),
                ],
              ),

              const Text(
                '¿No tienes cuenta? Regístrate aquí',
                style: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  color: Color(0xff1154c8),
                  fontFamily: 'Italiana',
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff154579)),
                  onPressed: () {},
                  child: const Text(
                    'Continuar',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Italiana',
                      color: Colors.white, // Aquí indicas blanco
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
