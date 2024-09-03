import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:projeto_contatinhos/model/contact_model.dart';

class ContactService {
  Future<List<Contact>> getContacts(token) async {
    const url = 'http://191.252.222.51/contatinhos';
    final response = await http.get(Uri.parse(url),
        headers: <String, String>{HttpHeaders.authorizationHeader: token});
    List<Contact> contacts = List<Contact>.empty(growable: true);
    if (response.statusCode == 200) {
      List resList = await jsonDecode(response.body);
      for (Map<String, dynamic> mContact in resList) {
        Contact c = Contact.fromJson(mContact);
        contacts.add(c);
      }
    }
    return contacts;
  }

  Future<bool> createContact(token, name, description, phone, userId) async {
    const url = 'http://191.252.222.51/contatinhos';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{HttpHeaders.authorizationHeader: token},
      body: {
        'nome': name,
        'descricao': description,
        'telefone': phone,
        'usuarioId': userId
      },
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateContact(
      token, id, userId, name, description, phone) async {
    const url = 'http://191.252.222.51/contatinhos';
    final response = await http.put(Uri.parse(url), headers: <String, String>{
      HttpHeaders.authorizationHeader: token
    }, body: {
      'id': id,
      'nome': name,
      'descricao': description,
      'telefone': phone,
      'usuarioId': userId
    });
    if (response.statusCode == 201) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<bool> deleteContact(token, contactId) async {
    String url = 'http://191.252.222.51/contatinhos/$contactId';
    final response = await http.delete(Uri.parse(url),
        headers: <String, String>{HttpHeaders.authorizationHeader: token});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
