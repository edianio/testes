import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';
import 'package:prova/src/presentation/pages/home/components/favorite_books_section/book_list_tile.dart';
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

    if(bookState is LoadedBooksState){
      return SizedBox(
        height: 320,
        child: NotificationListener<ScrollNotification>(
          onNotification: (_){
            return true;
          },
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: ColorTable.purple,
              child: ListView.builder(
                itemCount: bookState.books.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    BookListTile(book: bookState.books[index]),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
