import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/auth/authservices.dart';
import 'package:task1/signin_page.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

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
          "main Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blueAccent,
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/flutter.png'),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text(' explore new items',
                        style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
          ),

          // Item List Section
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.fastfood),
                  title: Text('item $index'),
                  subtitle: Text("Description for item $index"),
                ),
              );
            },
          )),

          // Bottom Navigation Section
        ],
      ),
    );
  }
}
