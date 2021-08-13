import 'package:flutter/material.dart';
import 'package:receita_crud/app/my_app.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FaceCook extends StatefulWidget {
  FaceCook({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FaceCook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("imagem/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),

            child: Column(

              children: [

                SizedBox(
                  height: 50,
                ),

                CarouselSlider(
                  options: CarouselOptions(height: 400.0),
                  items: ['imagem/LogoFaceCook.png', 'imagem/Home2.png' ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: Image.asset(i)
                        );
                      },
                    );
                  }).toList(),
                ),

                SizedBox(
                  height: 20,
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
                            .pushNamed(MyApp.LISTA),
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
