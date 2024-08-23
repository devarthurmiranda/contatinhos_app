import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/contact_controller.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';
import 'package:projeto_contatinhos/model/contact_model.dart';
import 'package:projeto_contatinhos/widgets/contact_tile.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  UserController userController = Get.put(UserController());
  ContactController contactController = Get.put(ContactController());

  @override
  void initState() {
    super.initState();
    contactController
        .getContacts(); // Fetch contacts when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatinhos'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(() {
        if (contactController.contacts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              Contact contact = contactController.contacts[index];
              return ContactTile(contact);
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Get.toNamed('/add_contact');
          },
          child: const Icon(Icons.add)),
    );
  }
}
