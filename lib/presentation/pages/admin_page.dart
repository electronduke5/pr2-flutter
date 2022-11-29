import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          const Center(
            child: Text('Страница админа'),
          ),
          ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('Выйти'))
        ],
      ),
    );
  }
}
