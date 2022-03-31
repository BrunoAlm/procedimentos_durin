// ignore_for_file: prefer_if_null_operators

class UserModel {
  UserModel({
    required this.id,
    required this.nome,
    required this.senha,
    required this.setor,
    required this.dataCriacao,
  });

  final int id;
  final String nome;
  final String senha;
  final String setor;
  final String dataCriacao;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] == null ? 'null' : json['id'],
        nome: json['nome'] == null ? 'null' : json['nome'],
        senha: json['senha'] == null ? 'null' : json['senha'],
        setor: json['setor'] == null ? 'null ' : json['setor'],
        dataCriacao: json['dataCriacao'] == null ? 'null' : json['dataCriacao'],
      );
}
