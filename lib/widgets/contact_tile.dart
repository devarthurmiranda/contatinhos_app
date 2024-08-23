import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_contatinhos/controller/contact_controller.dart';
import 'package:projeto_contatinhos/model/contact_model.dart';

class ContactTile extends StatefulWidget {
  Contact contact;

  ContactTile(this.contact);

  @override
  _ContactTileState createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  late Contact _contact;
  final ContactController controller = Get.find();

  @override
  void initState() {
    super.initState();
    _contact = widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    print("Recriando Contato " + widget.contact.nome);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
          title: Text(_contact.nome),
          subtitle: Text(
              'Telefone: ${_contact.telefone} | Descrição: ${_contact.descricao}'),
          trailing: Wrap(
            spacing: 12,
            children: [
              IconButton(
                onPressed: () {
                  Get.toNamed('/updateProfile');
                },
                icon: const Icon(Icons.edit_document),
              ),
              IconButton(
                onPressed: () {
                  controller.delete(_contact);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )),
    );
  }
}
