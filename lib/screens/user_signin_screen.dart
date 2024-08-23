import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';

class UserSigninScreen extends StatefulWidget {
  const UserSigninScreen({super.key});

  @override
  State<UserSigninScreen> createState() => _UserSigninScreenState();
}

class _UserSigninScreenState extends State<UserSigninScreen> {
  UserController userController = Get.put(UserController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                controller: _usernameController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: _emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  controller: _passwordController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    userController.signin(_usernameController.text,
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
