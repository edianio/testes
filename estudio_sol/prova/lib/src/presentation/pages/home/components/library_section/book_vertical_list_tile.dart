import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/utils/color_table.dart';

class BookVerticalListTile extends StatelessWidget {
  final BookEntity book;

  const BookVerticalListTile({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed('/book', arguments: book);
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book.cover,
                height: 70,
                width: 48,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 10,),

            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                children: <Widget>[
                  AutoSizeText(
                    book.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorTable.blackTitle,
                    ),
                    maxLines: 2,
                    minFontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 10,),

                  AutoSizeText(
                    book.author.name,
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

          ],
        ),
      ),
    );
  }
}
