
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/my_app.dart';
import 'package:receita_crud/app/view/receita_list_back.dart';

class ReceitaList extends StatelessWidget {
  final _back = ReceitaListBack();

  CircleAvatar circleAvatar(String url)  {
    return (Uri.tryParse(url)!.isAbsolute) ?
       CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(void Function()? onPressed){
    return IconButton(icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context,void Function()? remove){
    return IconButton(
      icon: Icon(Icons.delete), 
      color: Colors.red, 
      onPressed: () {
        showDialog(
          context: context, 
          builder:  (context) => AlertDialog(
            title: Text('Excluir'),
            content: Text('Confirma a Exclusão?'),
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Não'), 
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Sim'),
                onPressed: remove,
              ),
            ],
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Receita'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  //_back.goToForm(context);                                                    {:{:{: VERIFICAR :}}}}      
                })
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Receita>? lista = futuro.data as List<Receita>?;
                  return ListView.builder(
                    itemCount: lista!.length,
                    itemBuilder: (context, i) {
                      var receita = lista[i];
                      return ListTile(
                        leading: circleAvatar(receita.urlImagem ?? 'https://yt3.ggpht.com/ytc/AKedOLT_0KTDhZEuw3jfp_7Y2RPy_zG7sp5ly3RdlYTk=s900-c-k-c0x00ffffff-no-rj'),
                        title: Text(receita.nome!),
                        onTap: (){
                          _back.goToDetails(context, receita);
                        },
                        subtitle: Text(receita.descricao!),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton((){
                                _back.goToForm(context, receita);
                              }),
                              iconRemoveButton(context, (){
                                _back.remove(receita.id!);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}