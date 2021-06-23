import 'package:flutter/material.dart';
import 'package:receita_crud/app/view/cadastro.dart';
import 'package:receita_crud/app/view/confirmacao.dart';

import 'view/my_home_page.dart';

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: ColorScheme.dark(),
        primaryColor: Colors.deepOrange
        //colorScheme: ColorScheme.dark()
        

      ),
      routes: {
        "/": (context) => MyHomePage(),
        "Cadastro": (context) => Cadastro(),
        "Confirmacao": (context) => Confirmacao()

        },
    );
  }
}