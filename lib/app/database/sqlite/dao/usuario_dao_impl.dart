
import 'package:receita_crud/app/database/sqlite/connection.dart';
import 'package:receita_crud/app/domain/entities/usuario.dart';
import 'package:receita_crud/app/domain/interfaces/usuario_dao.dart';
import 'package:sqflite/sqflite.dart';


class UsuarioDAOImpl implements UsuarioDAO{
  @override
  Future<List<Usuario>> find() async {
    Database? _db = await Connection.get();

    List<Map<String,dynamic>>resultado = await _db!.query('usuario');
    List<Usuario>lista = List.generate(resultado.length,(i){
      var linha = resultado[i];

      return Usuario(

        id: linha['id_usuario'], 
        nome: linha['nome'],
        email: linha['email'], 
        adm: linha['adm']
        
      );

    });

    return lista;
  }

  @override
  remove(int id) async{
    Database? _db = await Connection.get();

    var sql= 'DELETE FROM usuario WHERE id =?';
    _db!.rawDelete(sql,[id]);
    
  }

  @override
  save(Usuario usuario) async{
    Database? _db = await Connection.get();

    var sql;

    if(usuario.id == null){
      sql = 'INSERT INTO usuario(nome, email, adm) VALUES(?,?,?)';
      _db!.rawInsert(sql,[usuario.nome, usuario.email, usuario.adm]);
    }
    else{
      sql = 'UPDATE tags SET nome=? WHERE id=?';
      _db!.rawUpdate(sql,[usuario.nome, usuario.email, usuario.adm, usuario.id]);
    }
    
  }

}