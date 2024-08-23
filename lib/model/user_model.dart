import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String nome;
  String email;

  User({
    required this.id,
    required this.nome,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json["id"], nome: json["nome"], email: json["email"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "email": email,
      };

  int getId() {
    return id;
  }
}
