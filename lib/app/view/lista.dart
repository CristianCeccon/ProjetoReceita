import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:receita_crud/app/domain/entities/receitas.dart';
import 'package:receita_crud/app/my_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:receita_crud/app/view/receita_list_back.dart';

class Lista extends StatefulWidget {
  Lista({Key? key}) : super(key: key);

  @override
  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final _back = ReceitaListBack();

  CircleAvatar circleAvatar(String url) {
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(void Function()? onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, void Function()? remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a Exclusão?'),
                    actions: [
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: remove,
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FaceCook",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Gotham-SSm'),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _back.goToForm(context);
              })
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("imagem/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Observer(builder: (context) {
            return Column(children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(height: 194.9),
                items: [
                  'imagem/ImagemComida1.jpg',
                  'imagem/ImagemComida2.png',
                  'imagem/ImagemComida3.jpg',
                  'imagem/ImagemComida4.jpg'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 1.0),
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: Image.asset(
                            i,
                            fit: BoxFit.scaleDown,
                          ));
                    },
                  );
                }).toList(),
              ),
              Expanded(
                child: FutureBuilder(
                    future: _back.list,
                    builder: (context, futuro) {
                      if (!futuro.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        List<Receita>? lista = futuro.data as List<Receita>?;
                        return ListView.builder(
                          itemCount: lista!.length,
                          itemBuilder: (context, i) {
                            var receita = lista[i];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: ListTile(
                                  leading: circleAvatar(receita.urlImagem ??
                                      'https://yt3.ggpht.com/ytc/AKedOLT_0KTDhZEuw3jfp_7Y2RPy_zG7sp5ly3RdlYTk=s900-c-k-c0x00ffffff-no-rj'),
                                  title: Text(receita.nome!),
                                  onTap: () {
                                    _back.goToDetails(context, receita);
                                  },
                                  subtitle: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 12.0),
                                    text: TextSpan(
                                      text: receita.descricao ?? "",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 15),
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        iconEditButton(() {
                                          _back.goToForm(context, receita);
                                        }),
                                        iconRemoveButton(context, () {
                                          _back.remove(receita.id!);
                                          Navigator.of(context).pop();
                                        })
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    }),
              )
            ]);
          })),
    );

    // SizedBox(
    //   height: 50,
    // ),

    // Center(

    //   child: Container(

    //       padding: EdgeInsets.only(right: 10, left: 10),

    //       decoration: BoxDecoration(

    //         color: Colors.amber.shade800,
    //         borderRadius: BorderRadius.all(Radius.circular(4))

    //       ),

    //       child: TextButton(

    //         onPressed: () => Navigator.of(context)
    //             .pushNamed(MyApp.FORMULARIO_RECEITA),
    //         child: Text("Cadastrar Receitas", style: TextStyle(color: Colors.white))

    //       )

    //   ),

    //   //child: TextButton(onPressed: () =>  Navigator.of(context).pushNamed(MyApp.CONFIRMACAO) , child: Text("Cadastrar Receitas"))
    // ),
    //   ],
    // ))

    /*floatingActionButton: FloatingActionButton(

        onPressed: (){
          Navigator.of(context).pushNamed("Cadastro");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),

      // ),*/

    // );
  }
}
