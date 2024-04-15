import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/pages/sign_up.dart';

import '../components/loading.dart';
import '../components/my_button_in.dart';
import '../components/textformfields.dart';
import '../services/auth_services.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;

  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  final AuthServices _auth = AuthServices();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';

  String password = '';

  String error = '';

  // sign user in method
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Stack(
            children: [
              // const LoginPageImages(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade500, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Scaffold(
                  backgroundColor: Colors.white10,
                  body: SafeArea(
                    child: Center(
                      child: Form(
                        key: formkey,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 50),

                              // logo
                              const Icon(
                                Icons.lock,
                                size: 100,
                                color: Colors.white,
                              ),

                              const SizedBox(height: 50),

                              // welcome
                              const Text(
                                'Welcome to our Ytü',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 20),

                              MyTextFormField(
                                controller: emailController,
                                hintText: 'Email',
                                obscureText: false,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter email";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
                                      .hasMatch(value)) {
                                    return "Please enter valid email";
                                  }
                                  return null;
                                },
                                onSaved: (String? email) {
                                  _email = email!;
                                },
                              ),

                              const SizedBox(height: 10),

                              // password textfield
                              MyTextFormField(
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: true,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter password";
                                  }
                                  if (value.length < 7) {
                                    return "Please enter valid password";
                                  }
                                  return null;
                                },
                                onSaved: (String? password) {
                                  passwordController.text = password!;
                                },
                              ),

                              const SizedBox(height: 10),

                              // forgot password?
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ForgotPasswordPage();
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 25),

                              // sign in button
                              MyButtonIn(onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          emailController.text,
                                          passwordController.text);
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'please make sure you enter the correct information';
                                      loading = false;
                                    });
                                  }
                                } else {
                                  print("Error");
                                }
                              }),

                              const SizedBox(height: 75),

                              // not a member? register now
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Not a member?',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  const SignUpPage()));
                                    },
                                    child: const Text(
                                      'Register now',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
