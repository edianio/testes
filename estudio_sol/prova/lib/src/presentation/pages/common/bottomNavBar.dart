import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32,
      onTap: (index){},
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
    );
  }
}
