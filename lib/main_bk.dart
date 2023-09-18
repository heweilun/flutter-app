import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello flutter',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(title: const Text('hello flutter'), centerTitle: true,),
        body: const Center(child: Text('ni111', style: TextStyle(color: Colors.red))) ,
      )
    );
  }
}