
import 'package:receita_crud/app/domain/entities/receitas.dart';

abstract class ReceitaDAO{

  save(Receita receitas);

  remove(dynamic id);

  Future<List<Receita>>find();
}