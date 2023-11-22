import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app2/avatar.dart';
import 'package:new_app2/firbaseauthimplementation/firebase_auth_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: -18,
              left: -30,
              child: Image.asset(
                lefttopLogin,
              ),
            ),
            Positioned(
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Color.fromARGB(255, 225, 121, 237),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'E-mail',
                          labelStyle:
                              const TextStyle(color: Colors.blueAccent)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email address';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 225, 121, 237),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Password',
                          labelStyle:
                              const TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(280, 60)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 209, 134, 226))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          signup();
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ],
              ),
            )),
            Positioned(
              bottom: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account"),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) {
                        //     return const LoginScreen();
                        //   }),
                        // );
                      },
                      child: Text('Log in'))
                ],
              ),
            ),
            Positioned(
              bottom: -22,
              child: Image.asset(bottomCenterLogin),
            )
          ],
        ),
      ),
    );
  }

  void signup() async {
    String email = emailController.text;
    String password = passwordController.text;
    await _auth.signupWithEmailandPassword(email, password);
  }
}
