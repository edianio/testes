import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';
import 'package:prova/src/presentation/pages/home/components/book_list_tile.dart';
import 'package:prova/src/utils/color_table.dart';

class HomeHorizontalBooksList extends StatefulWidget {
  const HomeHorizontalBooksList({Key? key}) : super(key: key);

  @override
  State<HomeHorizontalBooksList> createState() => _HomeHorizontalBooksListState();
}

class _HomeHorizontalBooksListState extends State<HomeHorizontalBooksList> {

  @override
  void initState(){
    context.read<BookBloc>().add(FavoriteBooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookBloc = context.watch<BookBloc>();
    final bookState = bookBloc.state;

    return ListView(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: 10),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 21, 20, 21),
              child: Row(
                children: <Widget>[

                  const Text(
                    'Livros favoritos',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorTable.blackTitle,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                  Expanded(child: Container()),

                  const Text(
                    'Ver todos',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorTable.purple,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                ],
              ),
            ),

            if(bookState is LoadedBooksState)
              SizedBox(
                height: double.maxFinite,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: bookState.books.length,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) =>
                      BookListTile(book: bookState.books[index]),
                ),
              ),

          ],
        ),
      ],
    );
  }
}
