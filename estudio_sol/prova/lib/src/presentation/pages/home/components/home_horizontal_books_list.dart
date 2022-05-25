import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';
import 'package:prova/src/presentation/pages/home/components/book_list_tile.dart';
import 'package:prova/src/presentation/pages/home/components/home_section_header.dart';
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

            HomeSectionHeader(title: 'Livros favoritos'),

            if(bookState is LoadedBooksState)
              SizedBox(
                height: 320,//TODO RESOLVER TAMANHO FIXO
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: bookState.books.length,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
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
