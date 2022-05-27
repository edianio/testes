import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/utils/color_table.dart';

class AuthorListTile extends StatelessWidget {
  final AuthorEntity author;
  final double radius = 8;
  
  const AuthorListTile({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: 248,
      child: Card(
        margin: const EdgeInsets.fromLTRB(10, 1, 10, 1),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: const BorderSide(
            color: ColorTable.blackShadow,
            width: 1,
          ),
        ),
        child: Row(
          children: <Widget>[

            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.network(
                author.picture,
                height: 67,
                width: 63,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
              child: Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    AutoSizeText(
                      author.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorTable.blackTitle,
                      ),
                      maxLines: 2,
                      minFontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),

                    AutoSizeText(
                      '${author.booksCount} ${author.booksCount > 1 ? 'livros' : 'livro'}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                          color: ColorTable.blackSubTitle,
                      ),
                      maxLines: 2,
                      minFontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
