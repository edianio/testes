import 'package:flutter/material.dart';
import 'package:prova/src/presentation/pages/common/header_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            HeaderPage(),
            // Expanded(
            //   child: Container(color: Colors.red,),
            // ),
          ],
        ),
      ),
    );
  }
}
