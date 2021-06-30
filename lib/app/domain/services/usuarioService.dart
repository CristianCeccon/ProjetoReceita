import 'package:get_it/get_it.dart';
import 'package:receita_crud/app/domain/entities/usuario.dart';
import 'package:receita_crud/app/domain/exception/domain_layer_exception.dart';
import 'package:receita_crud/app/domain/interfaces/usuario_dao.dart';

class UsuarioService{

  var _dao = GetIt.I.get<UsuarioDAO>();

  save(Usuario usuario){

    //validacao
    validateName(usuario.nome);
    validateEmail(usuario.email);

    _dao.save(usuario);

  }

  remove(int id){

    _dao.remove(id);

  }

  Future<List<Usuario>>find(){

    return _dao.find();

  }

  validateName(String name){
    var min = 3;
    var max = 50;

    if(name == null){

      throw new DomainLayerException("O nome e obrigatorio");
    }
    else if(name.length< min){

      throw new DomainLayerException("O nome deve ter pelo menos $min caracteres");
    }
    else if(name.length > max){

      throw new DomainLayerException("O nome deve possuir no maximo $max caracteres");
    }
  }

  validateEmail(String email){

    if(email == null){

      throw new DomainLayerException("O e-mail e obrigatorio");
    }
    else if(email.contains("@")){
      throw new DomainLayerException("O email tem que possuir o '@'");
    }
  }
}