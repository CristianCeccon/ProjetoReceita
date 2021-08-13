import 'package:flutter/material.dart';
import 'package:receita_crud/app/view/receita_form_back.dart';

import '../my_app.dart';

class ReceitaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget campoName(ReceitaFormBack back){

    return TextFormField(

      validator: back.validadeNome,

      onSaved: (newValue) => back.receita?.nome = newValue,

      initialValue: back.receita?.nome,

      decoration: InputDecoration(
        labelText: 'Nome',
        hintText: 'Macarrão Stuliate'
      )

    );

  }

  // Widget campoPorcao(ReceitaFormBack back){

  //   return TextFormField(

  //     keyboardType: TextInputType.number,

  //     decoration: InputDecoration(
  //       labelText: 'Porção',
  //       hintText: '3'
  //     )

  //   );

  // }

  Widget campoDescricao(ReceitaFormBack back){

    return TextFormField(

      validator: back.validadeDescricao,
      onSaved: (newValue) => back.receita?.descricao = newValue,
      initialValue: back.receita?.descricao,

      decoration: InputDecoration(
        labelText: 'Descrição',
        hintText: 'uma receita simples, barata e gostosa direto da Italia'
      )

    );

  }

  // Widget campoImage(ReceitaFormBack back){

  //   return TextFormField(

  //     decoration: InputDecoration(
  //       labelText: 'Endereço imagem',
  //       hintText: 'https//www.imagem.com'
  //     )

  //   );

  // }

  @override
  Widget build(BuildContext context) {

    var _back = ReceitaFormBack(context);

    return Scaffold(

      appBar: AppBar(

        title: Text('Cadastro de receita'),

      ),

      body: 

      Column(

        children: [

          Padding(

            padding: EdgeInsets.all(10),

            child: Form(

              key: _form,

              child: Column(

                children: [

                  campoName(_back),
                  campoDescricao(_back),
                  //campoImage(_back),
                  
                ],

              )

            ),

          ),

          SizedBox(
            height: 50,
          ),


          Center(

            child: Container(

              padding: EdgeInsets.only(right: 10, left: 10),

              decoration: BoxDecoration(

                color: Colors.amber.shade800,
                borderRadius: BorderRadius.all(Radius.circular(4))

              ),

              child: TextButton(

                onPressed: () {
                  _form.currentState?.validate();
                  _form.currentState?.save();


                  if(_back.isValid){

                    _back.save();
                    Navigator.of(context)
                      .pushNamed(MyApp.LISTA_RECEITA);

                  }
                  
                },
                child: Text(
                  "Cadastrar Receitas",
                  style: TextStyle(color: Colors.white)
                )

              )
            ),      
          ),

          /*TextButton.icon(

            onPressed: () =>  Navigator.of(context).pushNamed(MyApp.CONFIRMACAO),
             

            icon:(Icon(Icons.save)), 
            
            label: Text("Confirmar Cadastro"),
            

          ),*/


        ],

      )
      
      
      
  
    );
  }
}