import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

late String emailValue;
late String passwordValue;

final formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5E2D75),
            Color(0xFF750F5A),
          ],
        )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: "write your email",
                    labelText: 'Email',
                    suffixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    emailValue = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Obligatory field";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    suffixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    passwordValue = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Obligatory field";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16),
                    text: 'No tienes una cuenta? ',
                    children: <TextSpan>[
                      TextSpan(
                        style: TextStyle(
                            color: Colors.blueAccent[400],
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                        text: 'Registrate',
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => Navigator.of(context).pushReplacementNamed(
                                    'register',
                                  ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    _onLoginSuccess(context);
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('Login'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _onLoginSuccess(BuildContext context) {
  if (formKey.currentState!.validate()) {
    formKey.currentState!.save();
    Navigator.of(context).pushReplacementNamed('home', arguments: {
      'email': emailValue,
      'password': passwordValue,
    });
  }
}
