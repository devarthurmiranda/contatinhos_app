import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/contact_controller.dart';

import '../controller/user_controller.dart';

class UserAddContactScreen extends StatefulWidget {
  const UserAddContactScreen({super.key});

  @override
  State<UserAddContactScreen> createState() => _UserAddContactScreenState();
}

class _UserAddContactScreenState extends State<UserAddContactScreen> {
  final ContactController _contactController = Get.put(ContactController());
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
        title: const Text('Adicionar Contato'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nome'),
                controller: _nameController,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  controller: _descriptionController,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Telefone'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    _contactController.addContact(_nameController.text,
                        _descriptionController.text, _phoneController.text);
                  },
                  child: const Text('Adicionar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
