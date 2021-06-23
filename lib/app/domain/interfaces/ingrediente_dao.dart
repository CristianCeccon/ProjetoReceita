import 'package:receita_crud/app/domain/entities/ingrediente.dart';

abstract class IngredienteDAO{

  save(Ingrediente receitas);

  remove(int id);

  Future<List<Ingrediente>>find();
}