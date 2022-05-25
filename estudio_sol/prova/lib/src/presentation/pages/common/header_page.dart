import 'package:flutter/material.dart';
import 'package:prova/src/presentation/blocs/user/user_bloc.dart';
import 'package:prova/src/presentation/blocs/user/user_event.dart';
import 'package:prova/src/presentation/blocs/user/user_state.dart';
import 'package:prova/src/utils/color_table.dart';
import 'package:provider/provider.dart';

class HeaderPage extends StatefulWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {

  @override
  void initState(){
    context.read<UserBloc>().add(UserPictureEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = context.watch<UserBloc>();
    final userState = userBloc.state;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorTable.blackShadow,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Row(
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
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: <Widget>[

                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: ColorTable.purple,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Text(
                        'Meus Livros',
                        style: TextStyle(
                          color: ColorTable.blackTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 3,
                          color: Colors.white,//ColorTable.purple, TODO: ADICIONAR CONDICIONAL AQUI
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                      child: Text(
                        'Emprestados',
                        style: TextStyle(
                          color: ColorTable.blackTitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
