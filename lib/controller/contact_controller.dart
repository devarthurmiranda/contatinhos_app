import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/user_controller.dart';
import 'package:projeto_contatinhos/model/contact_model.dart';
import 'package:projeto_contatinhos/service/contact_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactController extends GetxController {
  final ContactService _service = ContactService();
  final UserController _userController = Get.put(UserController());
  late SharedPreferences prefs;
  var _contacts = <Contact>[].obs; // Make it observable
  List<Contact> get contacts => _contacts;

  void addContact(String name, String description, String phone) async {
    String? userId = await _userController.getUserId();
    String? token = await getToken();
    if (await _service.createContact(token, name, description, phone, userId)) {
      Get.offNamed('/home');
    } else {
      print('falha ao cadastrar');
    }
  }

  Future<void> delete(Contact contact) async {
    String? token = await getToken();

    if (await _service.deleteContact(token, contact.id)) {
      _contacts.remove(contact); // This will trigger UI updates
    }
  }

  Future<void> getContacts() async {
    String? token = await getToken();
    List<Contact> contacts = await _service.getContacts(token);
    _contacts.assignAll(contacts); // Update the observable list
  }

  Future<String?> getToken() async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  Future<void> updateContact(
      String id, String name, String description, String phone) async {
    String? token = await getToken();
    String? userId = await _userController.getUserId();
    if (await _service.updateContact(
        token, id, userId, name, description, phone)) {
      Get.offNamed('/home');
    } else {
      print('Failed to update contact');
    }
  }
}
