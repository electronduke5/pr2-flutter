import 'package:flutter/material.dart';
import 'package:pr2/core/db/database_helper.dart';
import 'package:pr2/presentation/pages/admin_page.dart';
import 'package:pr2/presentation/pages/auth/sign_in_page.dart';
import 'package:pr2/presentation/pages/auth/sign_up_page.dart';
import 'package:pr2/presentation/pages/user_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SignInPage(),
      routes: {
        "/AdminPage" : (context) => const AdminPage(),
        "/UserPage" : (context) => const UserPage(),
        "/SignUpPage" : (context) => const SignUpPage(),
        "/SignInPage" : (context) => const SignInPage(),
      },
    );
  }
}

