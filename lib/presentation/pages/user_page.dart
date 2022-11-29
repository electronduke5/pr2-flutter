import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        children: [
          const Center(
            child: Text('Страница пользователя'),
          ),
          ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: const Text('Выйти'))
        ],
      ),
    );
  }
}
