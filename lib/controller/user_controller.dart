import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/model/user_model.dart';
import 'package:projeto_contatinhos/service/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final UserService _service = UserService();
  late SharedPreferences prefs;

  Future<String?> getToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print(token);
    return token;
  }

  Future<void> updateUser(String name, String email, String password) async {
    String userId = await getUserId();
    String? token = await getToken();
    if (token != null) {
      String tokenSafe = token;
      if (await _service.updateUser(tokenSafe, userId, name, email, password)) {
        Get.offNamed('/profile');
      } else {
        Get.snackbar("Falha ao atualizar usuário",
            "Por favor, tente novamente mais tarde :(",
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<User?> getUser() async {
    String? token = await getToken();
    if (token != null) {
      String tokenSafe = token;
      Future<User?> user = _service.getUser(tokenSafe);
      return user;
    } else {
      Get.snackbar("Falha ao coletar informações de usuário!",
          "Por favor, tente novamente mais tarde :(",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<void> login(String email, String password) async {
    if (await _service.login(email, password)) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar("Falha ao realizar Login!", "Email ou Senha incorretos",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> signin(String username, String email, String password) async {
    if (await _service.signIn(username, email, password)) {
      Get.offAllNamed('/login');
    } else {
      Get.snackbar("Falha ao realizar Cadastro!",
          "Por favor, tente novamente mais tarde",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> isLogged() async {
    if (await getToken() == null) {
      Get.offAllNamed('/');
    }
  }

  Future<void> goHome() async {
    if (await getToken() != null) {
      Get.offAllNamed('/home');
    }
  }

  Future logout() async {
    String? token = await getToken();
    if (token != null) {
      String tokenSafe = token;
      if (await _service.logout(tokenSafe)) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        Get.offAllNamed('/');
      }
    } else {
      Get.snackbar("Falha ao realizar Logout!",
          "Por favor, tente novamente mais tarde :(",
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future delete() async {
    String? token = await getToken();
    if (token != null) {
      String tokenSafe = token;
      if (await _service.deleteUser(tokenSafe)) {
        Get.offAllNamed('/');
      } else {
        Get.snackbar("Falha ao deletar conta!",
            "Por favor, tente novamente mais tarde :(",
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<String> getUserId() async {
    User? user = await getUser();
    String userId = user!.getId().toString();
    return userId;
  }
}
