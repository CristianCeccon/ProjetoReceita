
import 'dart:async';
import 'package:path/path.dart';
import 'package:receita_crud/app/database/script.dart';
import 'package:sqflite/sqflite.dart';

class Connection{ 

  // ignore: unused_field
  static Database? _db;

  static Future<Database?> get()async{

    if(_db == null){

      var path = join(await getDatabasesPath(), 'banco_receita');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v){
          db.execute(createTable);
          db.execute(insertUsuario);
          db.execute(insertReceita);
          db.execute(insertIngrediente);
        },
      );

    }

    return _db;

  }
}