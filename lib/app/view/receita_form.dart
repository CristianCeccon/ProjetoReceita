import 'package:flutter/material.dart';
import 'package:receita_crud/app/view/receita_form_back.dart';

class ReceitaForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  
  Widget campoName(ReceitaFormBack back){
    return TextFormField(
      validator: back.validadeNome,
      onSaved: (newValue) => back.receita!.nome = newValue,
      initialValue: back.receita?.nome,
      decoration: InputDecoration(
        labelText: 'Nome',
        hintText: 'Macarrao Stuliate'
      )
    );
  }

  Widget campoPorcao(ReceitaFormBack back){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Porção',
        hintText: '3'
      )
    );
  }

  Widget campoDescrissao(ReceitaFormBack back){
    return TextFormField(
      validator: back.validadeDescrissao,
      onSaved: (newValue) => back.receita!.descrissao = newValue,
      initialValue: back.receita?.descrissao,
      decoration: InputDecoration(
        labelText: 'Descrissao',
        hintText: 'uma receita simples, barata e gostosa direto da Italia'
      )
    );
  }

  Widget campoImage(ReceitaFormBack back){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Endereco imagem',
        hintText: 'https//www.imagem.com'
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    var _back = ReceitaFormBack(context);
    return Scaffold(
      appBar: AppBar(

        title: Text('Cadastro de receita'),

        actions: [

          IconButton(
            onPressed: (){
              _form.currentState!.validate();
              _form.currentState!.save();
              if(_back.isValid){
                _back.save();
                Navigator.of(context).pop();
              }
            }, 
            icon:(Icon(Icons.save)))

        ],

      ),
      body: Padding(

        padding: EdgeInsets.all(10),

        child: Form(

          key: _form,

          child: Column(

            children: [

              campoName(_back),
              campoDescrissao(_back),
              campoImage(_back),
              
            ],

          )

        ),

      ),
  
    );
  }
}