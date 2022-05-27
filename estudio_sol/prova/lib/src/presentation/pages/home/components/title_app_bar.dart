import 'package:flutter/material.dart';
import 'package:prova/src/presentation/blocs/user/user_bloc.dart';
import 'package:prova/src/presentation/blocs/user/user_event.dart';
import 'package:prova/src/presentation/blocs/user/user_state.dart';
import 'package:prova/src/utils/color_table.dart';
import 'package:provider/provider.dart';

class TitleAppBar extends StatefulWidget {
  const TitleAppBar({Key? key}) : super(key: key);

  @override
  State<TitleAppBar> createState() => _TitleAppBarState();
}

class _TitleAppBarState extends State<TitleAppBar> {
  @override
  void initState(){
    context.read<UserBloc>().add(UserPictureEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserBloc>();
    final userState = userBloc.state;

    return Row(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: SizedBox(
            height: 44,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  'SS',
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.w400,
                      fontSize: 33,
                      color: ColorTable.blackTitle
                  ),
                ),
                Text(
                  'BOOK',
                  style: TextStyle(
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.w400,
                      fontSize: 33,
                      color: ColorTable.purple
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(child: Container()),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: userState is LoadedUserPictureState ? Image.network(
              userState.picture,
              height: 32,
              width: 32,
              fit: BoxFit.cover,
            ) :
            Container(
              color: ColorTable.blackShadow,
              height: 32,
              width: 32,
            ),
          ),
        ),

      ],
    );
  }
}
