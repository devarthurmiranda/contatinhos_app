import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';
import 'package:projeto_contatinhos/model/user_model.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 50,
              child: const Icon(Icons.person_4_outlined),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: FutureBuilder(
                future: userController.getUser(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    User? user = snapshot.data;
                    return Column(
                      children: [
                        Text(
                            style: const TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                            user!.nome),
                        Text(user.email)
                      ],
                    );
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/updateProfile');
                },
                child: const Text('Edit Profile'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  userController.logout();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                child: const Text('Logout'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    userController.delete();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Delete Account')),
            )
          ],
        ),
      ),
    );
  }
}
