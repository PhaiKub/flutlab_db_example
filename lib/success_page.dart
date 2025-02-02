import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffff00de),
          leading: const Icon(Icons.key, color: Colors.white),
          title: const Text('Login Success',
              style: TextStyle(color: Colors.white))),
    );
  }
}
