import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../create_account/create_user.dart';
import '../networks/auth_services.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = '';
  final password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform necessary actions here
      String email = _emailController.text;
      String password = _passwordController.text;
      print('Email: $email');
      print('Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
            body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'images/female_doctor.jpg',
                      width: 3500,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    const Text(
                      "Dementia Care App ",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        obscureText: true,
                        controller: _emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail)),
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email' //form is not valid
                                : null,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value != null && value.length < 7) {
                            return 'Enter min. 7 characters';
                          } else {
                            return null; //form is valid
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final message = await AuthService().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        final isValidForm = _formKey.currentState!.validate();
                        if (isValidForm) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }

                        // if (message!.contains('Success')) {
                        //   Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //       builder: (context) => const HomeScreen(),
                        //     ),
                        //   );
                        // }
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(message),
                        //     ),
                        //   );
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CreateUser(),
                          ),
                        );
                      },
                      child: const Text('Create Account'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
