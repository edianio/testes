import 'package:flutter/material.dart';
import 'package:prova/src/modules/author_modules.dart';
import 'package:prova/src/modules/book_modules.dart';
import 'package:prova/src/modules/category_book_modules.dart';
import 'package:prova/src/modules/user_modules.dart';
import 'package:prova/src/presentation/pages/home/home_page.dart';
import 'package:prova/src/utils/color_table.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ... userModules,
        ... bookModules,
        ... authorModules,
        ... categoryBookModules,
      ],
      child: MaterialApp(
        title: 'SS BOOK',
        theme: ThemeData(
          fontFamily: 'Roboto',
          scaffoldBackgroundColor: ColorTable.scaffoldBackgroundPage,
        ),
        home: const HomePage(),
      ),
    );
  }
}
