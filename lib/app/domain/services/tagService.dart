import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/domain/entities/tags.dart';
import 'package:receita_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:receita_crud/app/domain/interfaces/tags_dao.dart';

class TagService{

  var _dao = GetIt.I.get<TagsDAO>();

  save(Tags tags){

    //validacaoNome
    validateName(tags.nome);


    _dao.save(tags);

  }

  remove(int id){

    _dao.remove(id);

  }

  Future<List<Tags>>find(){

    return _dao.find();

  }

  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){

      throw new DomainLayerException("O nome e obrigatorio");
    }
    else if(name.length< min){

      throw new DomainLayerException("O nome da tag deve ter pelo menos $min caracteres");
    }
    else if(name.length > max){

      throw new DomainLayerException("O nome da tag deve possuir no maximo $max caracteres");
    }
  }

}