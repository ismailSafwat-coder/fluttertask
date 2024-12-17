import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/auth/authservices.dart';
import 'package:task1/custom/mytextfiled.dart';
import 'package:task1/homepage.dart';
import 'package:task1/signin_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String selectedgender = 'male';
  double age = 21;
  bool conditions = false;
  bool notifications = false;
  String statue = 'statue';
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
    double devicewidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'sign up',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formState,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
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
                      Row(
                        children: [
                          const Text('Gender :'),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('female'),
                                value: 'female',
                                groupValue: selectedgender,
                                onChanged: (val) {
                                  selectedgender = val!;
                                  setState(() {});
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                title: const Text('male'),
                                value: 'male',
                                groupValue: selectedgender,
                                onChanged: (val) {
                                  selectedgender = val!;
                                  setState(() {});
                                }),
                          )
                        ],
                      ),
                      DropdownMenu(
                          width: devicewidth,
                          label: const Text('single'),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 1, label: 'single'),
                            DropdownMenuEntry(value: 2, label: 'maried'),
                            DropdownMenuEntry(value: 3, label: 'divorced'),
                          ]),
                      Row(
                        children: [
                          Text('age : ${age.toInt()}'),
                          Expanded(
                            child: Slider(
                                value: age,
                                label: age.toInt().toString(),
                                min: 18,
                                max: 80,
                                divisions: 62,
                                onChanged: (val) {
                                  age = val;
                                  setState(() {});
                                }),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Receive Notifications'),
                          CupertinoSwitch(
                              value: notifications,
                              onChanged: (value) {
                                setState(() {
                                  notifications = value;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('I agree to the Terms and Conditions'),
                          Checkbox(
                            value: conditions,
                            onChanged: (val) {
                              conditions = val!;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: '\nNotes', border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (!conditions) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('Please agree to the terms.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }

                          if (formState.currentState!.validate()) {
                            String res = await Authservices().signup(
                              emailController.text,
                              passwordController.text,
                              context,
                            );
                            if (res == 'succeed') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              );
                            }
                          }
                        },
                        color: Colors.blue,
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have account '),
                          InkWell(
                            child: const Text(
                              'sign in',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 21),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninPage()));
                            },
                          ),
                        ],
                      ),
                    ],
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
