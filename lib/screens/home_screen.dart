import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:projeto_contatinhos/controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*
  @override
  void initState() {
    super.initState();
    UserController userController = Get.put(UserController());
    userController.isLogged();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatinhos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: 50,
              child: const Image(image: AssetImage('assets/logo.png')),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: const Text('Login'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/signin');
                  },
                  child: const Text('Cadastro')),
            )
          ],
        ),
      ),
    );
  }
}
