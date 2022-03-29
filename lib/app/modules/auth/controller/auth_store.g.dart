// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$nomeAtom = Atom(name: '_AuthControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$senhaAtom = Atom(name: '_AuthControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$listUsersAtom = Atom(name: '_AuthControllerBase.listUsers');

  @override
  List<UserModel> get listUsers {
    _$listUsersAtom.reportRead();
    return super.listUsers;
  }

  @override
  set listUsers(List<UserModel> value) {
    _$listUsersAtom.reportWrite(value, super.listUsers, () {
      super.listUsers = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_AuthControllerBase.getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setName(dynamic value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenha(dynamic value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
senha: ${senha},
listUsers: ${listUsers}
    ''';
  }
}
