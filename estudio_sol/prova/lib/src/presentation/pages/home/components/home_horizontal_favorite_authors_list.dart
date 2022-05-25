import 'package:flutter/material.dart';
import 'package:prova/src/presentation/blocs/author/author_bloc.dart';
import 'package:prova/src/presentation/blocs/author/author_event.dart';
import 'package:prova/src/presentation/blocs/author/author_state.dart';
import 'package:prova/src/presentation/pages/home/components/author_list_tile.dart';
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
      return ListView.separated(
          itemCount: authorState.authors.length,
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (_, index) {
            return AuthorListTile(author: authorState.authors[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 20,);
          },
      );
    } else {
      return Container();
    }

  }
}
