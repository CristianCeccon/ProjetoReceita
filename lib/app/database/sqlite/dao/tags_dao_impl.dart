
import 'package:receita_crud/app/database/sqlite/connection.dart';
import 'package:receita_crud/app/domain/entities/tags.dart';
import 'package:receita_crud/app/domain/interfaces/tags_dao.dart';
import 'package:sqflite/sqflite.dart';


class TagsDAOImpl implements TagsDAO{
  @override
  Future<List<Tags>> find() async {
    Database? _db = await Connection.get();

    List<Map<String,dynamic>>resultado = await _db!.query('tags');
    List<Tags>lista = List.generate(resultado.length,(i){
      var linha = resultado[i];

      return Tags(

        id: linha['id_tags'], 
        nome: linha['nome'], 

      );

    });

    return lista;
  }

  @override
  remove(int id) async{
    Database? _db = await Connection.get();

    var sql= 'DELETE FROM tags WHERE id =?';
    _db!.rawDelete(sql,[id]);
    
  }

  @override
  save(Tags tags) async{
    Database? _db = await Connection.get();

    var sql;

    if(tags.id == null){
      sql = 'INSERT INTO tags(nome) VALUES(?)';
      _db!.rawInsert(sql,[tags.nome]);
    }
    else{
      sql = 'UPDATE tags SET nome=? WHERE id=?';
      _db!.rawUpdate(sql,[tags.nome, tags.id]);
    }
    
  }

}