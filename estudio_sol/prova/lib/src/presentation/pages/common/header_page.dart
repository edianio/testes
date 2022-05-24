import 'package:flutter/material.dart';
import 'package:prova/src/utils/color_table.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 128,
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
                  child: Image.asset('assets/images/ssbook_logo.png'),
                ),

                Expanded(child: Container()),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.network(
                      'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg',
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
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
                          fontSize: 16.41,
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
                          fontSize: 16.41,
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
