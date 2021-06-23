
import 'package:receita_crud/app/domain/entities/receitas.dart';

abstract class ReceitaDAO{

  save(Receita receitas);

  remove(int id);

  Future<List<Receita>>find();
}