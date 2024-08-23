import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  late int id;
  late String nome;
  late String descricao;
  late String telefone;
  late int usuarioId;

  Contact({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.telefone,
    required this.usuarioId,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    nome = json["nome"];
    descricao = json["descricao"];
    telefone = json["telefone"];
    usuarioId = json["usuarioId"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "telefone": telefone,
      };
}
