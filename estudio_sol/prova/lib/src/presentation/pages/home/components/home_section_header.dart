import 'package:flutter/material.dart';
import 'package:prova/src/utils/color_table.dart';

class HomeSectionHeader extends StatelessWidget {
  String title;

  HomeSectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
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

          const Text(
            'ver todos',
            style: TextStyle(
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
