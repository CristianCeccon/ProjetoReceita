import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/entities/usuario.dart';


abstract class UsuarioDAO{

  save(Usuario usuario);

  remove(int id);

  Future<List<Usuario>>find();
}