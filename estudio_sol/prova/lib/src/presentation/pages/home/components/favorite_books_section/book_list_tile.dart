import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/utils/color_table.dart';

class BookListTile extends StatelessWidget {
  final BookEntity book;

  const BookListTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/book', arguments: book);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book.cover,
                height: 198,
                width: 136,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
              child: SizedBox(
                width: 136,
                child: AutoSizeText(
                  book.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: ColorTable.blackTitle,
                  ),
                  minFontSize: 16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 2),
              child: SizedBox(
                width: 136,
                child: AutoSizeText(
                  book.author.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: ColorTable.blackSubTitle,
                  ),
                  minFontSize: 14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
