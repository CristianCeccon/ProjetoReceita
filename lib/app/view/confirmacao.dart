import 'package:flutter/material.dart';

class Confirmacao extends StatefulWidget {
  const Confirmacao({ Key? key }) : super(key: key);

  @override
  _ConfirmacaoState createState() => _ConfirmacaoState();
}

class _ConfirmacaoState extends State<Confirmacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Column(

          children:[

            Text("""








            
            ////////////////////////////////////////////////////
            
            PARABENS VOCE CADASTROU UMA RECEITA!!!!!!

            ////////////////////////////////////////////////////
            








            """),

            TextButton(onPressed: () { Navigator.of(context).pushNamed("/"); }, child: Text("Voltar pra pagina inicial"))

          ]
        )
      
      )
      
    );
  }
}