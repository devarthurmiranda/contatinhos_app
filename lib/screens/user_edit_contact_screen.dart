import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/contact_controller.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';

class UserEditContactScreen extends StatefulWidget {
  const UserEditContactScreen({super.key});

  @override
  State<UserEditContactScreen> createState() => _UserEditContactScreenState();
}

class _UserEditContactScreenState extends State<UserEditContactScreen> {
  final ContactController _contactController = Get.put(ContactController());
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _phoneController = TextEditingController();
    UserController userController = Get.put(UserController());
    userController.isLogged();
  }

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments['id'];
    final name = Get.arguments['nome'];
    final description = Get.arguments['descricao'];
    final phone = Get.arguments['telefone'];

    _nameController.text = name;
    _descriptionController.text = description;
    _phoneController.text = phone;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Contato'),
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
                  decoration: const InputDecoration(labelText: 'Descricao'),
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
                    _contactController.updateContact(id, _nameController.text,
                        _descriptionController.text, _phoneController.text);
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
