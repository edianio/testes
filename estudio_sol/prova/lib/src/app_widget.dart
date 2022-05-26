import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/modules/author_modules.dart';
import 'package:prova/src/modules/book_modules.dart';
import 'package:prova/src/modules/category_book_modules.dart';
import 'package:prova/src/modules/graphql_modules.dart';
import 'package:prova/src/modules/user_modules.dart';
import 'package:prova/src/presentation/pages/book/book_detail_page.dart';
import 'package:prova/src/presentation/pages/home/home_page.dart';
import 'package:prova/src/utils/color_table.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ... graphqlModules,
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
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: ColorTable.blackSubTitle,
            showUnselectedLabels: true,
            selectedItemColor: ColorTable.purple,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: ColorTable.purple,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/book':
              return MaterialPageRoute(
                  builder: (_) => BookDetailPage(book: settings.arguments as BookEntity)
              );
            case '/':
            default:
              return MaterialPageRoute(
                  builder: (_) => const HomePage()
              );
          }
        },
      ),
    );
  }
}
