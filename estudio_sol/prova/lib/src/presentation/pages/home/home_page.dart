import 'package:flutter/material.dart';
import 'package:prova/src/presentation/pages/common/header_page.dart';
import 'package:prova/src/presentation/pages/home/components/home_horizontal_books_list.dart';
import 'package:prova/src/presentation/pages/home/components/home_white_base.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Início',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,),
            label: 'Adicionar',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: 'Buscar',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: 'Favoritos',
          ),

        ],
      ),
      body: Column(
        children: <Widget>[
          HeaderPage(),

          Expanded(
            child: ListView(
              primary: true,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                HomeHorizontalBooksList(),
                HomeWhiteBase(),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
