import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text("Receitas"),

      ),

      body: Center(

        child: TextButton(onPressed: () { Navigator.of(context).pushNamed("Cadastro"); }, child: Text("Cadastrar Receitas"))

      ),

      /*floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.of(context).pushNamed("Cadastro");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),

      ),*/

    );
  }
}
