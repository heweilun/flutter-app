import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '点击计数',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const HomePage(title: '计数器')
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('你已经点了的次数'),
            Text('$_count', style: const TextStyle(color: Colors.green))
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _increase(_count),child: const Icon(Icons.add),),
    );
  }

  void _increase(int num) {
    setState(() {
      _count += num;
    });
  }
}