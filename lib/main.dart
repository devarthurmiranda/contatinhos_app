import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/screens/home_screen.dart';
import 'package:projeto_contatinhos/screens/user_add_contact_screen.dart';
import 'package:projeto_contatinhos/screens/user_edit_contact_screen.dart';
import 'package:projeto_contatinhos/screens/user_home_screen.dart';
import 'package:projeto_contatinhos/screens/user_login_screen.dart';
import 'package:projeto_contatinhos/screens/user_profile_screen.dart';
import 'package:projeto_contatinhos/screens/user_signin_screen.dart';
import 'package:projeto_contatinhos/screens/user_update_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contatinhos',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/signin', page: () => const UserSigninScreen()),
        GetPage(name: '/login', page: () => const UserLoginScreen()),
        GetPage(name: '/home', page: () => const UserHomeScreen()),
        GetPage(name: '/add_contact', page: () => const UserAddContactScreen()),
        GetPage(name: '/profile', page: () => const UserProfileScreen()),
        GetPage(name: '/updateProfile', page: () => const UserUpdateScreen()),
        GetPage(name: '/editContact', page: () => const UserEditContactScreen())
      ],
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: false,
      ),
    );
  }
}
