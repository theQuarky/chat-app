import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map<String, dynamic>> getUser() async {
    print('I\'m being called');
    try {
      print('checkpoint A');
      Map<String, dynamic> user = await FacebookAuth.instance.getUserData();
      print('data: ${user}');
      return user;
    } catch (e) {
      print('checkpoint B');
      print(e);
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Logout'),
            ),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: getUser(),
            builder: (context, snapshot) {
              // print('DATA: ${snapshot.data?['picture'].url}');

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  children: [
                    if (snapshot.hasData)
                      Image.network(
                        // snapshot.data,
                        snapshot.data?['picture']['data']['url'],
                        width: 100, // adjust width as needed
                        height: 100,
                        loadingBuilder: (context, child, loadingProgress) =>
                            const CircularProgressIndicator(), // adjust height as needed
                      ),
                    Text(
                      'Email: ${FirebaseAuth.instance.currentUser!.email ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Display Name: ${FirebaseAuth.instance.currentUser!.displayName ?? 'N/A'}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
