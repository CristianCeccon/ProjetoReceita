
import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/database/sqlite/dao/ingrediente_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/receita_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/tags_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/usuario_dao_impl.dart';
import 'package:receita_crud/app/domain/interfaces/ingrediente_dao.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';
import 'package:receita_crud/app/domain/interfaces/tags_dao.dart';
import 'package:receita_crud/app/domain/interfaces/usuario_dao.dart';

setupinjection(){

  GetIt getIt = GetIt.I;

  getIt.registerSingleton<ReceitaDAO>(ReceitaDAOImpl());

  getIt.registerSingleton<UsuarioDAO>(UsuarioDAOImpl());

  getIt.registerSingleton<TagsDAO>(TagsDAOImpl());

  getIt.registerSingleton<IngredienteDAO>(IngredienteDAOImpl());

}

