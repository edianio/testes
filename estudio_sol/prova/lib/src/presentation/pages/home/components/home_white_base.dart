import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/models/category_book_model.dart';
import 'package:prova/src/presentation/pages/home/components/library_section/home_all_books_list.dart';
import 'package:prova/src/presentation/pages/home/components/home_section_header.dart';
import 'package:prova/src/presentation/pages/home/components/author_section/home_horizontal_favorite_authors_list.dart';
import 'package:prova/src/presentation/pages/home/components/library_section/horizontal_buttons_list.dart';
import 'package:prova/src/utils/color_table.dart';

class HomeWhiteBase extends StatelessWidget {
  final List<CategoryBookEntity> categories = [
    CategoryBookModel.fromString('TODOS'),
    CategoryBookModel.fromString('ROMANCE'),
    CategoryBookModel.fromString('ADVENTURE'),
    CategoryBookModel.fromString('COMEDY'),
    CategoryBookModel.fromString('HORROR'),
    CategoryBookModel.fromString('TECHNOLOGY'),
    CategoryBookModel.fromString('TRAVEL'),
  ];

  HomeWhiteBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          children: <Widget>[
            HomeSectionHeader(title: 'Autores favoritos', option: 'ver todos',),
            const HomeHorizontalFavoriteAuthorsList(),

            HomeSectionHeader(title: 'Biblioteca'),
            HorizontalButtonsList(categories: categories),
            const HomeAllBooksList(),
          ],
        ),
      ),
    );
  }
}
