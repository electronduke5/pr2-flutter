import 'package:flutter/material.dart';
import 'package:pr2/core/db/database_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 20,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("init"),
            ),
          ),
        ],
      ),
    );
  }
}

