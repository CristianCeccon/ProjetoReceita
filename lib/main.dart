import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:receita_crud/app/injection.dart';
import 'package:receita_crud/app/view/cadastro.dart';

import 'app/my_app.dart';

void main() async{
  setupinjection();
  runApp(MyApp());

  //_____________________ Teste do Firebase __________________________

  /*await Firebase.initializeApp();

  var collection = FirebaseFirestore.instance.collection('receita');

  var result = await collection.get();

  //demonstrar o resultado atualizado a partir da collection no firestore
  collection.snapshots().listen((r) { 

    result = r;

  });

  for(var doc in result.docs){
    print(doc['name']);
  }*/

  //utilizado para criação de novas receitas a partir do collection no firestore
  // no local .set pode ser usado: .delete, .update

  /*collection.doc('receita3').set(
    {

    'name':'Açai',
    'descricao':'Bater com uvas e leite condensado no liquidificador'

    },
    SetOptions(merge:true)
  ).then((value) => print('deu certo!'))
    .catchError((error)=>print('deu errado $error'));*/
    
}

