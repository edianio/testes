import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/presentation/pages/common/bottomNavBar.dart';
import 'package:prova/src/presentation/pages/common/heart_checkbox.dart';
import 'package:prova/src/utils/color_table.dart';

class BookDetailPage extends StatelessWidget {
  final BookEntity book;

  const BookDetailPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height / 3) * 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.cover),
                fit: BoxFit.fill,
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),

          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 285, 0, 0),
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 30),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: AutoSizeText(
                            book.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorTable.blackTitle,
                            ),
                            maxLines: 3,
                            minFontSize: 20,
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 2),
                          child: HeartCheckbox(),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                      child: AutoSizeText(
                        book.author.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: ColorTable.blackSubTitle,
                        ),
                        maxLines: 2,
                        minFontSize: 14,
                      ),
                    ),

                    Text(
                      book.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorTable.blackTitle,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
