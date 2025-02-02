import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'DatabaseHelper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void registerUser() async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      await DatabaseHelper().registerUser(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Register successful'),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error Email already exists'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          leading: const Icon(Icons.key, color: Colors.white),
          title: const Text('Register User',
              style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //EmailController
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            //PasswordController
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            //create textlink register
            TextButton(
              onPressed: registerUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child:
                  const Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
