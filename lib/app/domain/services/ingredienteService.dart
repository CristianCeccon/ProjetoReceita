import 'dart:js_util';

import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/domain/entities/ingrediente.dart';
import 'package:receita_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:receita_crud/app/domain/interfaces/ingrediente_dao.dart';

class IngredienteService{

  var _dao = GetIt.I.get<IngredienteDAO>();

  save(Ingrediente ingrediente){

    //validacaoNome
    validateName(ingrediente.nome);
    //validacaoQuantidade
    validadeQuantidade(ingrediente.quantidade);
    //validacaoMedida
    validateMedida(ingrediente.medida);


    _dao.save(ingrediente);
  }

  remove(int id){

    _dao.remove(id);
  }

  Future<List<Ingrediente>>find(){

    return _dao.find();
  }

  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){

      throw new DomainLayerException("O nome e obrigatorio");

    }
    else if(name.length< min){

      throw new DomainLayerException("O nome do ingrediente deve ter pelo menos $min caracteres");
    }
    else if(name.length > max){

      throw new DomainLayerException("O nome do ingrediente deve possuir no maximo $max caracteres");
    }
  }

  validadeQuantidade(int quantidade){
    var min = 1;
    var max = 600;

    if(quantidade == null){

      throw new DomainLayerException("A quantidade e obrigatoria");
    }
    else if(quantidade < min){

      throw new DomainLayerException("A quantidade deve ser $min ou maior");
    }
    else if(quantidade > max){

      throw new DomainLayerException("A quatidade deve ser no maximo $max ingredientes");
    }

  }

  validateMedida(String medida){
    
    var min = 1;
    var max = 5;

    if(medida == null){

      throw new DomainLayerException("a medida deve ser preenchida");
    }
    else if(medida.length < min){

      throw new DomainLayerException("a medida deve conter pelo menos $min caractere");

    }
    else if(medida.length > max){

      throw new DomainLayerException("a medida deve conter no maximo $max caractere");
    }
  }

  //var dao = ReceitaDAOImpl();

}