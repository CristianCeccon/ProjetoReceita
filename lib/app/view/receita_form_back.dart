import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';

part 'receita_form_back.g.dart';

class ReceitaFormBack = _ReceitaFormBack with _$ReceitaFormBack;

abstract class _ReceitaFormBack with Store{

  Receita? receita;
  

  //diferenciar o novo da alteracao
  _ReceitaFormBack(BuildContext context){

    var parameter = ModalRoute.of(context)?.settings.arguments;

    if(parameter != null){

      receita = parameter as Receita;
      
    }
  }



  //salvar


  //validacoes
  

}