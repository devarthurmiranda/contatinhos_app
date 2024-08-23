import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/contact_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactController());
  }
}
