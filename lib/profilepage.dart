import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/auth/authservices.dart';
import 'package:task1/signin_page.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Authservices().singout();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SigninPage()));
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text(
          "profile Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
