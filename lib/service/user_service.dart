import 'dart:convert';
import 'dart:io';
import 'package:projeto_contatinhos/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> login(String username, String password) async {
    const url = 'http://191.252.222.51/login';
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final response = await http.post(Uri.parse(url), body: {
      'email': username,
      'senha': password,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> resp = jsonDecode(response.body);
      String token = resp['token'];
      prefs.setString('token', token);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout(String token) async {
    String url = 'http://191.252.222.51/logout';
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> signIn(String username, String email, String password) async {
    const url = 'http://191.252.222.51/usuario';
    final response = await http.post(Uri.parse(url),
        body: {'nome': username, 'email': email, 'senha': password});
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<User?> getUser(String token) async {
    const url = 'http://191.252.222.51/usuario';
    final response = await http.get(Uri.parse(url),
        headers: <String, String>{HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 200) {
      User user = User.fromJson(jsonDecode(response.body));
      return user;
    }
    return null;
  }

  Future<bool> updateUser(String token, String userId, String name,
      String email, String password) async {
    const url = 'http://191.252.222.51/usuario';
    final response = await http.put(Uri.parse(url), headers: <String, String>{
      HttpHeaders.authorizationHeader: token
    }, body: {
      'id': userId,
      'nome': name,
      'email': email,
      'senha': password,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUser(String token) async {
    const url = 'http://191.252.222.51/usuario';
    final response = await http.delete(Uri.parse(url),
        headers: <String, String>{HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
