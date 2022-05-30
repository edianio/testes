import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/models/category_book_model.dart';
import 'package:prova/src/presentation/pages/common/bottomNavBar.dart';
import 'package:prova/src/presentation/pages/home/components/author_section/home_horizontal_favorite_authors_list.dart';
import 'package:prova/src/presentation/pages/home/components/header_page.dart';
import 'package:prova/src/presentation/pages/home/components/favorite_books_section/home_horizontal_books_list.dart';
import 'package:prova/src/presentation/pages/home/components/home_section_header.dart';
import 'package:prova/src/presentation/pages/home/components/library_section/home_all_books_list.dart';
import 'package:prova/src/presentation/pages/home/components/library_section/horizontal_buttons_list.dart';
import 'package:prova/src/presentation/pages/home/components/title_app_bar.dart';
import 'package:prova/src/utils/color_table.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CategoryBookEntity> categories = [
    CategoryBookModel.fromString('TODOS'),
    CategoryBookModel.fromString('ROMANCE'),
    CategoryBookModel.fromString('ADVENTURE'),
    CategoryBookModel.fromString('COMEDY'),
    CategoryBookModel.fromString('HORROR'),
    CategoryBookModel.fromString('TECHNOLOGY'),
    CategoryBookModel.fromString('TRAVEL'),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TitleAppBar(),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: ColorTable.purple,
            child: ListView(
              primary: true,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: <Widget>[
                const HeaderPage(),

                HomeSectionHeader(title: 'Livros favoritos', option: 'ver todos',),
                const HomeHorizontalBooksList(),

                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.zero,
                      bottomRight: Radius.zero,
                      bottomLeft: Radius.zero,
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    children: <Widget>[
                      HomeSectionHeader(title: 'Autores favoritos', option: 'ver todos',),
                      const HomeHorizontalFavoriteAuthorsList(),

                      HomeSectionHeader(title: 'Biblioteca'),
                      HorizontalButtonsList(categories: categories),
                      const HomeAllBooksList(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}
