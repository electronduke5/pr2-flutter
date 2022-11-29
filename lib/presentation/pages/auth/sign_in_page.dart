import 'package:flutter/material.dart';
import 'package:pr2/data/repository/auth_repository_impl.dart';
import 'package:pr2/domain/entity/role.dart';
import 'package:pr2/domain/usecases/auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration:
              BoxDecoration(color: Colors.orangeAccent.withOpacity(0.4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Card(
                  elevation: 7,
                  shadowColor: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Магазин велосипедов'),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Добро пожаловать\n в систему!",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 250,
                            height: 50,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Обязательное поле';
                                }
                              },
                              controller: _loginController,
                              decoration: const InputDecoration(
                                labelText: 'Логин',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.account_box_outlined),
                              ),
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Обязательное поле';
                                }
                              },
                              obscureText: true,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Пароль',
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.password),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _onSignInClick();
                                _loginController.clear();
                                _passwordController.clear();
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10),
                              child: Text('Войти'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/SignUpPage');
                            },
                            child: const Text('Ещё нет аккаунта?'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignInClick() async {
    final AuthRepositoryImpl auth = AuthRepositoryImpl();
    var result = await Auth(auth).signIn(
      AuthParams(
        login: _loginController.text,
        password: _passwordController.text,
      ),
    );
    result.fold((left) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(left)));
    }, (right) {
      switch (right) {
        case RoleEnum.admin:
          Navigator.pushNamed(context, '/AdminPage');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Вы АДМИН')));
          break;
        case RoleEnum.user:
          Navigator.pushNamed(context, '/UserPage');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Вы USER')));
          break;
      }
    });
  }
}
