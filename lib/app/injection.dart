
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/database/firestore/receita_dao_firestore.dart';
import 'package:receita_crud/app/database/sqlite/dao/ingrediente_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/receita_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/tags_dao_impl.dart';
import 'package:receita_crud/app/database/sqlite/dao/usuario_dao_impl.dart';
import 'package:receita_crud/app/domain/interfaces/ingrediente_dao.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';
import 'package:receita_crud/app/domain/interfaces/tags_dao.dart';
import 'package:receita_crud/app/domain/interfaces/usuario_dao.dart';
import 'package:receita_crud/app/domain/services/receitaService.dart';

setupinjection() async {

  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // dao para o banco Local
  //getIt.registerSingleton<ReceitaDAO>(ReceitaDAOImpl());

  // get para dao para o banco FireStore
  getIt.registerSingleton<ReceitaDAO>(ReceitaDAOFirestore());

  getIt.registerSingleton<ReceitaService>(ReceitaService());

  getIt.registerSingleton<UsuarioDAO>(UsuarioDAOImpl());

  getIt.registerSingleton<TagsDAO>(TagsDAOImpl());

  getIt.registerSingleton<IngredienteDAO>(IngredienteDAOImpl());

  

}

