import 'package:flutter/material.dart';
import 'package:prova/src/presentation/pages/common/bottomNavBar.dart';
import 'package:prova/src/presentation/pages/common/header_page.dart';
import 'package:prova/src/presentation/pages/home/components/favorite_books_section/home_horizontal_books_list.dart';
import 'package:prova/src/presentation/pages/home/components/home_section_header.dart';
import 'package:prova/src/presentation/pages/home/components/home_white_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: ListView(
        primary: true,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          const HeaderPage(),

          HomeSectionHeader(title: 'Livros favoritos', option: 'ver todos',),
          HomeHorizontalBooksList(),

          HomeWhiteBase(),
          //HomeSectionHeader(title: 'Autores favoritos', option: 'ver todos',),
          //HomeHorizontalFavoriteAuthorsList(),//TODO REFAZER ESSA PARTE

          //HomeSectionHeader(title: 'Biblioteca'),
          //HorizontalButtonsList(categories: categories),
          //const HomeAllBooksList(),
        ],
      ),
    );
  }
}
