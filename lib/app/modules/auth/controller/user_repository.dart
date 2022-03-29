import 'package:hasura_connect/hasura_connect.dart';
import 'package:procedimentos_durin/app/modules/auth/model/user_model.dart';

class UserRepository {
  final HasuraConnect _hasuraConnect;

  UserRepository(this._hasuraConnect);

  Future<List<UserModel>> getUsers() async {
    List<UserModel> listUsers = [];
    UserModel userModel;
    var query = '''
      query getUsers {
        procedimentos_durin_usuarios (order_by: {id: asc}){
          id
          nome
          senha
          setor
          dataCriacao
        }
      }
    ''';

    var snapshot = await _hasuraConnect.query(query);
    for (var json
        in (snapshot['data']['procedimentos_durin_usuarios']) as List) {
      userModel = UserModel.fromJson(json);
      listUsers.add(userModel);
    }
    return listUsers;
  }

  Future<List<UserModel>> getSenha(String nome) async {
    List<UserModel> listUsers = [];
    UserModel userModel;
    var query = '''
      query BuscaSenha {
        procedimentos_durin_usuarios(where: {nome: {_like: \$nome}}) {
          senha
        }
      }
    ''';

    var snapshot = await _hasuraConnect.query(query);
    for (var json
        in (snapshot['data']['procedimentos_durin_usuarios']) as List) {
      userModel = UserModel.fromJson(json);
      listUsers.add(userModel);
    }
    return listUsers;
  }

  // novo método adicionado
  Future<String> addCard(String nome, String setor, String senha) async {
    var query = """
      mutation addUsers(\$nome:String!, \$setor:String!, \$senha:String!) {
      insert_procedimentos_durin_usuarios(objects: {nome: \$nome, setor: \$setor, senha: \$senha}) {
        affected_rows
        returning {
          nome
          senha
          setor
        }
      }
    }
    """;
    var data = await _hasuraConnect.mutation(query, variables: {
      "nome": nome,
      "setor": setor,
      "senha": senha,
    });
    return data["data"]['insert_procedimentos_durin_usuarios']['returning'][0]
        ['nome'];
  }
}
