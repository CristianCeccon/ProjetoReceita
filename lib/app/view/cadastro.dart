

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:receita_crud/app/database/script.dart';
import 'package:receita_crud/app/database/sqlite/connection.dart';
import 'package:receita_crud/app/database/sqlite/dao/receita_dao_impl.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:sqflite/sqflite.dart';

class Cadastro extends StatelessWidget{
  const Cadastro({ Key? key }) : super(key: key);

  Future<List<Receita>>_buscar() async{
    return ReceitaDAOImpl().find();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Cadastro de receita'),

      ),

      body: Center(

        child: Column(
          
          children: [

            TextField(

              decoration: InputDecoration(
                labelText: "Digite o nome do prato:" 
              ),

            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 1:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 2:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 3:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Descrissao:" 
              ),
              
            ),

            TextButton(onPressed: () { Navigator.of(context).pushNamed("Confirmacao"); }, child: Text("Confirmar Cadastro"))

          ]),
      )

    );

  }

  // ignore: unused_element
  Future<List<Map<String,dynamic>>> _buscar() async{

    Database? db = await Connection.get();
    
    /*String path = join( await getDatabasesPath(), 'banco');
    Database db = await openDatabase(

      path, 
      version: 1, 

      onCreate: (db, v){
        db.execute(createTable);
        db.execute(insertUsuario);
        db.execute(insertReceita);
        db.execute(insertIngrediente);
      }

      );*/

      return db!.query('usuario');
  }
  
}


