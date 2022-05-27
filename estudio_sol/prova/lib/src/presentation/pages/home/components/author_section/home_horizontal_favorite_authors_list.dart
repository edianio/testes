import 'package:flutter/material.dart';
import 'package:prova/src/presentation/blocs/author/author_bloc.dart';
import 'package:prova/src/presentation/blocs/author/author_event.dart';
import 'package:prova/src/presentation/blocs/author/author_state.dart';
import 'package:prova/src/presentation/pages/home/components/author_section/author_list_tile.dart';
import 'package:prova/src/utils/color_table.dart';
import 'package:provider/provider.dart';

class HomeHorizontalFavoriteAuthorsList extends StatefulWidget {
  const HomeHorizontalFavoriteAuthorsList({Key? key}) : super(key: key);

  @override
  State<HomeHorizontalFavoriteAuthorsList> createState() => _HomeHorizontalFavoriteAuthorsListState();
}

class _HomeHorizontalFavoriteAuthorsListState extends State<HomeHorizontalFavoriteAuthorsList> {

  @override
  void initState(){
    context.read<AuthorBloc>().add(FavoriteAuthorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authorBloc = context.watch<AuthorBloc>();
    final authorState = authorBloc.state;

    if(authorState is LoadedAuthorState){
      return Container(
        height: 69,
        margin: const EdgeInsets.fromLTRB(0, 32, 0, 20),
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
                  itemCount: authorState.authors.length,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  primary: false,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return AuthorListTile(author: authorState.authors[index]);
                  },
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
