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
    userController.isLogged().then((success) {
      contactController.getContacts();
    }).catchError((error) => print(error));
    // Fetch contacts when the screen is initialized
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
          return const Center(
            child: Text(
              'Sem contatinhos ainda :(',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              Contact contact = contactController.contacts[index];
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(Icons.delete, color: Colors.white)),
                onDismissed: (direction) {
                  contactController.delete(contact);
                },
                child: ContactTile(contact),
              );
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
