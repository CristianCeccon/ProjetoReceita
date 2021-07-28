import 'package:flutter/cupertino.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';

class ReceitaDetailsBack{
  BuildContext context;

  Receita? receita;

  ReceitaDetailsBack(this.context){
    receita = ModalRoute.of(context)!.settings.arguments as Receita?;
  }

  goToBack(){

    Navigator.of(context).pop();

  }
}