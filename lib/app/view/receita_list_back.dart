
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/services/receitaService.dart';
import 'package:receita_crud/app/my_app.dart';
import 'package:receita_crud/app/view/cadastro.dart';

//flutter packages pub run build_runner watch

part'receita_list_back.g.dart';

class ReceitaListBack = _ReceitaListBack with _$ReceitaListBack;

abstract class _ReceitaListBack with Store{
  var _service = GetIt.I.get<ReceitaService>();

  //atualizar lista de receita
  @observable
  Future<List<Receita>>? list;

  @action
  refreshList([dynamic value]){

    list= _service.find();
    
  }

  _ReceitaListBack(){

    refreshList();

  }

  //método para chamar o form
  goToForm(BuildContext context, [Receita? receita]){
    Navigator.of(context)
      .pushNamed(
        MyApp.FORMULARIO_RECEITA,
        arguments: receita,
      );
  }

  goToDetails(BuildContext context, Receita receita){
    Navigator.of(context).pushNamed(MyApp.DETALHES_RECEITA, arguments: receita);
  }

  //goToForm(BuildContext context,[Receita receita]){
  //  Navigator.of(context).pushNamed(MyApp.RECEITA, arguments:receita).then(refreshList);
  //}


  //excluir
  remove(dynamic id, BuildContext context) async {
    await _service.remove(id);
    refreshList();
    Navigator.of(context).pop();
  }

}