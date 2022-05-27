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
