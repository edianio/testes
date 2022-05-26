import 'package:flutter/material.dart';
import 'package:prova/src/utils/color_table.dart';

class HomeSectionHeader extends StatelessWidget {
  String title;
  String? option;

  HomeSectionHeader({Key? key, required this.title, this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: ColorTable.blackTitle
            ),
          ),

          Expanded(child: Container()),

          if(option != null)
            Text(
              option!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: ColorTable.purple,
              ),
            ),

        ],
      ),
    );
  }
}
