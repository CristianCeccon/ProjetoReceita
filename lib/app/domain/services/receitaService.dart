//import 'package:receita_crud/app/database/sqlite/dao/receita_dao_impl.dart';

import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';

class ReceitaService{

  var _dao = GetIt.I.get<ReceitaDAO>();

  save(Receita receitas){

    //validacao
    validateName(receitas.nome!);
    validadeDescricao(receitas.descricao!);

    _dao.save(receitas);
  }

  remove(int id){

    _dao.remove(id);
  }

  Future<List<Receita>>find(){

    return _dao.find();
  }

  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){

      throw new DomainLayerException("O nome e obrigatório");
    }
    else if(name.length< min){

      throw new DomainLayerException("O nome da receita deve ter pelo menos $min caracteres");
    }
    else if(name.length > max){

      throw new DomainLayerException("O nome da receita deve possuir no máximo $max caracteres");
    }
  }

  validadeDescricao(String descricao){
    var min = 15;
    var max = 600;

    if(descricao == null){

      throw new DomainLayerException("A descrição e obrigatória");
    }
    else if(descricao.length< min){

      throw new DomainLayerException("A descrição da receita deve ter pelo menos $min caracteres");
    }
    else if(descricao.length > max){

      throw new DomainLayerException("A descricao da receita deve possuir no máximo $max caracteres");
    }

  }

  //var dao = ReceitaDAOImpl();

}