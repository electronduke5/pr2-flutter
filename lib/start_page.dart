

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});


  @override
  Widget build(BuildContext context) {
    List<String> strings = [
      'Hellow',
      'Hellow2',
      'Hellow3',
    ];

    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context,index){
            return Card(
              color: Colors.blue,
                child: Text(strings[index], style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
            );
          },
        itemCount: strings.length,
      ),
    );
  }
}
