// import 'package:flutter_triple/flutter_triple.dart';
import 'package:mobx/mobx.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/user_repository.dart';
import 'package:procedimentos_durin/app/modules/auth/model/user_model.dart';

// part './home_controller.g.dart';
part 'auth_store.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  late UserRepository repository;
  _AuthControllerBase(this.repository);
  @observable
  String nome = '';
  @action
  setName(value) => nome = value;

  @observable
  String senha = '';
  @action
  setSenha(value) => senha = value;

  @observable
  String setor = '';
  @action
  setSetor(value) => setor = value;

  @observable
  List<UserModel> listUsers = <UserModel>[].asObservable();

  @observable
  String? selectedValue;

  @action
  getUsers() async {
    listUsers = await repository.getUsers();
  }

  // novo método adicionado
  @action
  addUser() async {
    await repository.addCard(nome: nome, senha: senha, setor: setor);
    await getUsers();
  }
}
