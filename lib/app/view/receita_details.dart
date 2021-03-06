
import 'package:flutter/material.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/view/receita_details_back.dart';
import 'package:url_launcher/url_launcher.dart';


class ReceitaDetails extends StatelessWidget {
  const ReceitaDetails({ Key? key }) : super(key: key);

  launchApp(String url, BuildContext context)async{
    await canLaunch(url) ? await launch(url) : showDialog(

      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Alerta!'),
          content: Text('Nao foi possível encontrar um APP'),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    var _back = ReceitaDetailsBack(context);
    Receita receita = _back.receita!;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){

          var width = constraints.biggest.width;
          var radius = width/3;
          var height = constraints.biggest.height;

          return Scaffold(

            body: ListView(
              

              padding: EdgeInsets.all(60),

              children: [

                (Uri.tryParse(receita.urlImagem!)!.isAbsolute)?
                  CircleAvatar(
                    
                    backgroundImage: NetworkImage(receita.urlImagem!),
                    radius: radius,

                  ):

                  CircleAvatar(
                    
                    child: Icon(Icons.person, size: width/2,),
                    radius: radius,

                  ),

                Center(

                  child: Text('${receita.nome}', style: TextStyle(fontSize: 30)),

                ),
                

                Card(

                  child: ListTile(
                    
                    title: Text('Descrição'), 
                    subtitle: Text('${receita.descricao}'), 
                    trailing: Container(width: width/4, child: Row(children: [IconButton(color: Colors.blue,icon: Icon(Icons.food_bank), 
                    onPressed:(){

                      launchApp('https://pub.dev/packages/url_launcher',context);

                    })],),),

                    
                  ),
                  

                ),

                Card(

                  child: ListTile(
                    
                    title: Text('Quantidade de Porções'), 
                    subtitle: Text('${receita.qtn}'), 
                    trailing: Container(width: width/4, child: Row(children: [IconButton(color: Colors.blue,icon: Icon(Icons.food_bank), 
                    onPressed:(){

                      launchApp('https://pub.dev/packages/url_launcher',context);

                    })],),),

                    
                  ),

                  
                  

                ),

                Card(

                  child: ListTile(
                    
                    title: Text('Ingredientes'), 
                    subtitle: Text('${receita.ingrediente}'), 
                    trailing: Container(width: width/4, child: Row(children: [IconButton(color: Colors.blue,icon: Icon(Icons.food_bank), 
                    onPressed:(){

                      launchApp('https://pub.dev/packages/url_launcher',context);

                    })],),),

                    
                  ),
                  

                ),

                Card(

                  child: ListTile(
                    
                    title: Text('Modo de Preparo'), 
                    subtitle: Text('${receita.modoPreparo}'), 
                    trailing: Container(width: width/4, child: Row(children: [IconButton(color: Colors.blue,icon: Icon(Icons.food_bank), 
                    onPressed:(){

                      launchApp('https://pub.dev/packages/url_launcher',context);

                    })],),),

                    
                  ),

                  
                  

                )

                
              ]
              

            ),

            floatingActionButton: FloatingActionButton(

              child: Icon(Icons.arrow_back),

              onPressed: (){

                _back.goToBack();

              },
            ),

          );  
      
      },
    );

  }

}