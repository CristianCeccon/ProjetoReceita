

import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget{
  const Cadastro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Cadastro de receita'),

      ),

      body: Center(

        child: Column(
          
          children: [

            TextField(

              decoration: InputDecoration(
                labelText: "Digite o nome do prato:" 
              ),

            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 1:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 2:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Digite ingrediente 3:" 
              ),
              
            ),

            TextField(

              decoration: InputDecoration(
                labelText: "Descrissao:" 
              ),
              
            ),

            TextButton(onPressed: () { Navigator.of(context).pushNamed("Confirmacao"); }, child: Text("Confirmar Cadastro"))

          ]),
      )

    );

  }
  
}


