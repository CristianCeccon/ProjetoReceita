import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import '../my_app.dart';

class Categoria extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final List<String> titles = ["Almoço de Domingo", "Lanches", "Massas", "Churrasco", "Bolos", "Sorvete", "Outros" ];

    final List<Widget> images = [
        Container(
          child: Image.asset('../imagem/ImagemComida1.jpg'),
          color: Colors.red,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida2.png'),
          color: Colors.yellow,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida3.jpg'),
          color: Colors.black,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida4.jpg'),
          color: Colors.amber,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida5.jpg'),
          color: Colors.brown,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida6.jpg'),
          color: Colors.pink,
        ),
        Container(
          child: Image.asset('../imagem/ImagemComida7.jpg'),
          color: Colors.green,
        ),
    ];
    return Scaffold(
      body: 

      Container(

        decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("../imagem/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),

        child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  titles: titles,  // required
                  images: images,  // required
                  textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), // optional
                  onPageChanged: (page) { // optional
                  },
                  onSelectedItem: (index) { // optional
                  },
                  initialPage: 0, // optional
                  align : ALIGN.CENTER // optional
                ),
              ),
            ),

            SizedBox(
            height: 50,
            ),


            Container(

              padding: EdgeInsets.only(right: 10, left: 10),

              decoration: BoxDecoration(color: Colors.amber ,borderRadius: BorderRadius.all(Radius.circular(4))),

              child: TextButton.icon(

              onPressed: () =>  Navigator.of(context).pushNamed(MyApp.HOME),

              icon:(Icon(Icons.backpack, color: Colors.white,)), 
            
              label: Text("Voltar", style: TextStyle(color: Colors.white)),
            
            ),

            ),

            SizedBox(
            height: 50,
            ),

            
          ],
        ),
      ),      
      ),
    );
  }
}
