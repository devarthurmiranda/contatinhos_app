import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';

class UserUpdateScreen extends StatefulWidget {
  const UserUpdateScreen({super.key});

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  final UserController _userController = Get.put(UserController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserController userController = Get.put(UserController());
    userController.isLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar usuário'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Novo nome'),
                controller: _nameController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Novo email'),
                  controller: _emailController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Nova senha'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _userController.updateUser(_nameController.text,
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
