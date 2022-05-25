import 'package:flutter/material.dart';
import 'package:prova/src/presentation/pages/home/components/home_section_header.dart';
import 'package:prova/src/presentation/pages/home/components/home_horizontal_favorite_authors_list.dart';
import 'package:prova/src/utils/color_table.dart';

class HomeWhiteBase extends StatelessWidget {
  const HomeWhiteBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,//TODO RESOLVER O TAMANHO FIXO
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorTable.blackShadow,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
        ),
      ),
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HomeSectionHeader(title: 'Autores favoritos'),
            const Flexible(child: HomeHorizontalFavoriteAuthorsList()),
          ],
        ),
      ),
    );
  }
}
