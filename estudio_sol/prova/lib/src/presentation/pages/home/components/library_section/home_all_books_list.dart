import 'package:flutter/material.dart';
import 'package:prova/src/presentation/blocs/book/book_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';
import 'package:prova/src/presentation/pages/home/components/library_section/book_vertical_list_tile.dart';
import 'package:provider/provider.dart';

class HomeAllBooksList extends StatefulWidget {
  const HomeAllBooksList({Key? key}) : super(key: key);

  @override
  State<HomeAllBooksList> createState() => _HomeAllBooksListState();
}

class _HomeAllBooksListState extends State<HomeAllBooksList> {

  @override
  void initState(){
    context.read<BookBloc>().add(AllBooksEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookBloc = context.watch<BookBloc>();
    final bookState = bookBloc.state;

    if(bookState is LoadedBooksState){
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(20, 32, 20, 20),
        child: ListView.builder(
          itemCount: bookState.books.length,
          primary: false,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index){
            return BookVerticalListTile(book: bookState.books[index],);
          },
        ),
      );
    } else {
      return Container();
    }

  }
}
