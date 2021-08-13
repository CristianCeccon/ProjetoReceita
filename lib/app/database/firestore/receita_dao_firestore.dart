import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/domain/interfaces/receita_dao.dart';

class ReceitaDAOFirestore implements ReceitaDAO{
  late CollectionReference receitaCollection;

  ReceitaDAOFirestore(){
    receitaCollection = FirebaseFirestore.instance.collection('receita');
  }
  @override
  Future<List<Receita>> find() async{ 
    var result = await receitaCollection.get();
    return result.docs.map(
      (doc) => Receita(
        id:doc.reference.id.toString(),
        nome: doc['nome'],
        descricao: doc['descricao'],    
    )
    ).toList();
  }

  @override
  remove(id) {
    receitaCollection.doc(id).delete();
  }

  @override
  save(Receita receitas) {

    receitaCollection.doc(receitas.id).set(
      {
        'nome':receitas.nome,
        'descricao':receitas.descricao,
      }
    );
  }
  
}