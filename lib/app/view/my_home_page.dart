import 'package:flutter/material.dart';
import 'package:receita_crud/app/my_app.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

          title: Text("FaceCook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'Gotham-SSm'),),

        ),

        body: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("../imagem/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(

              children: [

                CarouselSlider(

                  options: CarouselOptions(height: 400.0),

                  items: [
                    '../imagem/ImagemComida1.jpg',
                    '../imagem/ImagemComida2.png',
                    '../imagem/ImagemComida3.jpg',
                    '../imagem/ImagemComida4.jpg'
                  ].map((i) {

                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            decoration:
                                BoxDecoration(color: Colors.transparent),
                            child: Image.asset(i));
                      },
                    );
                  }).toList(),

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

                        onPressed: () => Navigator.of(context)
                            .pushNamed(MyApp.FORMULARIO_RECEITA),
                        child: Text("Cadastrar Receitas", style: TextStyle(color: Colors.white))

                      )
                  ),

                  //child: TextButton(onPressed: () =>  Navigator.of(context).pushNamed(MyApp.CONFIRMACAO) , child: Text("Cadastrar Receitas"))
                ),
              ],
            ))

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
