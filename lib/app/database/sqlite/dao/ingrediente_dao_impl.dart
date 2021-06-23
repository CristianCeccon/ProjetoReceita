
import 'package:receita_crud/app/database/sqlite/connection.dart';
import 'package:receita_crud/app/domain/entities/ingrediente.dart';
import 'package:receita_crud/app/domain/interfaces/ingrediente_dao.dart';
import 'package:sqflite/sqflite.dart';


class IngredienteDAOImpl implements IngredienteDAO{
  @override
  Future<List<Ingrediente>> find() async {
    Database? _db = await Connection.get();

    List<Map<String,dynamic>>resultado = await _db!.query('ingrediente');
    List<Ingrediente>lista = List.generate(resultado.length,(i){
      var linha = resultado[i];

      return Ingrediente(

        id: linha['id_ingrediente'], 
        nome: linha['nome'], 
        quantidade: linha['quantidade'],
        medida: linha['medida']

      );

    });

    return lista;
  }

  @override
  remove(int id) async{
    Database? _db = await Connection.get();

    var sql= 'DELETE FROM ingredienteWHERE id =?';
    _db!.rawDelete(sql,[id]);
    
  }

  @override
  save(Ingrediente ingrediente) async{
    Database? _db = await Connection.get();

    var sql;

    if(ingrediente.id == null){
      sql = 'INSERT INTO ingrediente(nome, descrissao) VALUES(?,?,?)';
      _db!.rawInsert(sql,[ingrediente.nome, ingrediente.quantidade, ingrediente.medida]);
    }
    else{
      sql = 'UPDATE ingrediente SET nome=?, quantidade=?, medida=? WHERE id=?';
      _db!.rawUpdate(sql,[ingrediente.nome, ingrediente.quantidade, ingrediente.medida, ingrediente.id]);
    }
    
  }

}