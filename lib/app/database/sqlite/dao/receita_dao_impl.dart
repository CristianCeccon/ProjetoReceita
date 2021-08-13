
import 'package:receita_crud/app/database/sqlite/connection.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';
import 'package:sqflite/sqflite.dart';

class ReceitaDAOImpl implements ReceitaDAO{
  @override
  Future<List<Receita>> find() async {
    Database? _db = await Connection.get();

    List<Map<String,dynamic>>resultado = await _db!.query('receita');
    List<Receita>lista = List.generate(resultado.length,(i){
      var linha = resultado[i];

      return Receita(

        id: linha['id_receita'], 
        nome: linha['nome'], 
        descricao: linha['descricao'],
        urlImagem: linha['urlImagem'],
        email: linha['email'],

      );

    });

    return lista;
  }

  @override
  remove(int id) async{
    Database? _db = await Connection.get();

    var sql= 'DELETE FROM receita WHERE id =?';
    _db!.rawDelete(sql,[id]);
    
  }

  @override
  save(Receita receita) async{
    Database? _db = await Connection.get();

    var sql;

    if(receita.id == null){
      sql = 'INSERT INTO receita (nome, descricao) VALUES(?,?)';
      _db!.rawInsert(sql,[receita.nome, receita.descricao]);
    }
    else{
      sql = 'UPDATE receita SET nome=?, descricao=? WHERE id=?';
      _db!.rawUpdate(sql,[receita.nome, receita.descricao, receita.id]);
    }
    
  }

}