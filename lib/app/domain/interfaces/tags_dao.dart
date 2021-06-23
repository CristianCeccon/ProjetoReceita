import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/entities/tags.dart';

abstract class TagsDAO{

  save(Tags tags);

  remove(int id);

  Future<List<Tags>>find();
}