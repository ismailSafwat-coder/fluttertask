// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task1/auth/authservices.dart';
import 'package:task1/custom/mytextfiled.dart';
import 'package:task1/homepage.dart';
import 'package:task1/signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool rememberme = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'sign in',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Form(
                  key: formState,
                  child: Column(
                    children: [
                      Image.asset(
                        'images/flutter.png',
                        height: 100,
                        width: 100,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'flutter',
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Mytextfiled(
                        controller: emailController,
                        hintText: 'E M A I L',
                        obscureText: false,
                        icon: Icons.email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Mytextfiled(
                        controller: passwordController,
                        hintText: 'P A S S W O R D',
                        obscureText: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text('Remember Me'),
                        trailing: Checkbox(
                          value: rememberme,
                          onChanged: (val) {
                            rememberme = val!;
                            setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            String res = await Authservices().signin(
                                email: emailController.text,
                                password: passwordController.text,
                                context: context);
                            if (res == 'succeed') {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            }
                          }
                        },
                        color: Colors.blue,
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('don\'t have account '),
                          InkWell(
                            child: const Text(
                              'sign up',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 21),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupPage()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
