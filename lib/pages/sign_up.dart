import 'package:flutter/material.dart';
import 'package:nerdesin_ytu/services/auth_services.dart';

import '../components/loading.dart';
import '../components/my_button_up.dart';
import '../components/textformfields.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthServices _auth = AuthServices();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    bool passwordConfirmed() {
      if (passwordController.text == confirmPasswordController.text)
        return true;
      else
        return false;
    }

    return loading
        ? const Loading()
        : Stack(
            children: [
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
                      child: SingleChildScrollView(
                        child: Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 100),

                              MyTextFormField(
                                controller: usernameController,
                                hintText: 'Username',
                                obscureText: false,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter username";
                                  }
                                  return null;
                                },
                                onSaved: (String? name) {
                                  setState(() {
                                    name = name!;
                                  });
                                },
                              ),

                              const SizedBox(height: 10),

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
                                onSaved: (String? emailValue) {
                                  setState(() {
                                    email = emailValue!;
                                  });
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
                                  if (value.length < 8 || value.length > 16) {
                                    return "Your password must be 8-16 characters";
                                  }
                                  return null;
                                },
                                onSaved: (String? passwordValue) {
                                  passwordController.text = passwordValue!;
                                },
                              ),

                              const SizedBox(height: 10),

                              MyTextFormField(
                                controller: confirmPasswordController,
                                hintText: 'Confirm Password',
                                obscureText: true,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please enter re-password";
                                  }
                                  if (!passwordConfirmed()) {
                                    return "Password do not match";
                                  }
                                  return null;
                                },
                                onSaved: (String? confirmPassword) {
                                  confirmPasswordController.text =
                                      confirmPassword!;
                                },
                              ),

                              const SizedBox(height: 25),

                              // sign in button
                              MyButtonUp(onTap: () async {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          emailController.text,
                                          passwordController.text,
                                          usernameController.text);
                                  if (result == null) {
                                    setState(() {
                                      error = 'please supply a valid email';
                                      loading = false;
                                    });
                                  }
                                }
                              }),

                              const SizedBox(height: 75),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Already a member?',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  LoginPage()));
                                    },
                                    child: const Text(
                                      'Login now',
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
