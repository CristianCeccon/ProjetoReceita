import 'dart:convert';

import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';
import 'package:http/http.dart' as http;

class ReceitaDAOMySQL implements ReceitaDAO{
  final uriREST = Uri.parse('http://192.168.0.107:8080/receita');

  @override
  Future<List<Receita>> find() async {
    
    var resposta = await http.get(uriREST);

    if(resposta.statusCode == 200){

      throw Exception('Erro REST API.');
    
    }

    Iterable listDart = json.decode(resposta.body);

    //listDart.forEach((item) => print(item));

    // ignore: deprecated_member_use
    var listReceita = <Receita>[];

    for(Map<String,dynamic>item in listDart){
      // vamos pegar o item
      // apos pegar vamos converter para receita
      // e adicionamos o listReceita
      listReceita.add(
        Receita(
          id:item['id'],
          nome: item['nome'],
          descricao: item['descricao'],
          qtn: item['qtn'],
          modoPreparo: item['modoPreparo'],
          ingrediente: item['ingrediente'],
          suporte: item['suporte'],
          urlImagem: item['urlImagem']
        )
      );
    }
    throw UnimplementedError();
  } 

  @override
  remove(id) async {

    var uri = Uri.parse('http://192.168.0.107:8080/receita/$id');

    var resposta = await http.delete(uri);

    if(resposta.statusCode != 200){

      throw Exception('Erro RestAPI');
    }
    
    throw UnimplementedError();

  }

  @override
  save(Receita receita) async {
    var headers = {
      'Content-Type':'application/json'
    };

    var receitaJson = jsonEncode(
      {
        'id':receita.id,
        'nome':receita.nome,
        'descricao':receita.descricao,
        'qtn':receita.qtn,
        'modoPreparo':receita.modoPreparo,
        'ingrediente':receita.ingrediente,
        'suporte':receita.suporte,
        'urlImagem':receita.urlImagem,
      }
    );

    int statusCode = 0;

    if(receita.id == null){
      //salvando
      var resposta = await http.post(uriREST,headers:headers,body:receitaJson);
      statusCode = resposta.statusCode;

    }
    else{

      var resposta = await http.put(uriREST,headers:headers,body:receitaJson);
      statusCode = resposta.statusCode;

    }
    if(statusCode != 200){

      throw Exception('Erro RestAPI');
    }
    
    throw UnimplementedError();
  }
  
}