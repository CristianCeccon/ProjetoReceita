import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/services/receitaService.dart';

part 'receita_form_back.g.dart';

class ReceitaFormBack = _ReceitaFormBack with _$ReceitaFormBack;

abstract class _ReceitaFormBack with Store{

  Receita? receita;

  var _service = GetIt.I.get<ReceitaService>();

  bool _nomeIsValid;
  bool _descricaoIsValid;

  @action
  bool get isValid => _nomeIsValid && _descricaoIsValid;
  

  //diferenciar o novo da alteracao
  _ReceitaFormBack(BuildContext context){

    var parameter = ModalRoute.of(context)?.settings.arguments;

    if(parameter != null){

      receita = parameter as Receita;
      
    }
  }



  //salvar
  save() async{
    await _service.save(receita!);
  }


  //validacoes
  String? validadeNome(String name){
    try{
      _service.validateName((name));
      _nomeIsValid = true;

      return null;

    }catch(e){
      _nomeIsValid = false;

      return e.toString();
    }

  }

  String? validadeDescrissao(String descrissao){
    try{
      _service.validadeDescrissao((descrissao));
      _descricaoIsValid = true;

      return null;

    }catch(e){
      _descricaoIsValid = false;

      return e.toString();
    }

  }
  

}