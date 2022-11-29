import 'package:flutter/material.dart';
import 'package:pr2/data/repository/auth_repository_impl.dart';
import 'package:pr2/domain/usecases/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                          "Регистрация",
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
                              controller: _loginController,
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Обязательное поле';
                                }
                                if (value.length > 20) {
                                  return 'Слишком большое знаение';
                                }
                                if (value.length < 3) {
                                  return 'Минимальная длина 3 символа';
                                }
                                return null;
                              },
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
                                print(value);
                                if(value!.isEmpty){
                                  return 'Обязательное поле';
                                }
                                if (value.length > 20) {
                                  return 'Слишком большое знаение';
                                }
                                if (value.length < 5) {
                                  return 'Минимальная длина 5 символа';
                                }
                                RegExp regex = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{5,}$');
                                if (!regex.hasMatch(value)) {
                                  return 'Пароль должен содержать буквы ицифры';
                                }
                                return null;
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
                              print(!_formKey.currentState!.validate());
                              if (_formKey.currentState!.validate()) {
                                _onSignUpClick();
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 10),
                              child: Text('Зарегистрироваться'),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/SignInPage');
                            },
                            child: const Text('Уже есть аккаунт?'),
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

  void _onSignUpClick() async {
    final AuthRepositoryImpl auth = AuthRepositoryImpl();
    var result = await Auth(auth).signUp(
      AuthParams(
        login: _loginController.text,
        password: _passwordController.text,
      ),
    );
    result.fold((left) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Проверьте данные и повторите попытку!')));
    }, (right) {
      Navigator.pushReplacementNamed(context, '/SignInPage');
    });
  }
}
