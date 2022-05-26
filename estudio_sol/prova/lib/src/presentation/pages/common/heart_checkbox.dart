import 'package:flutter/material.dart';
import 'package:prova/src/utils/color_table.dart';

class HeartCheckbox extends StatefulWidget {
  const HeartCheckbox({Key? key}) : super(key: key);

  @override
  State<HeartCheckbox> createState() => _HeartCheckboxState();
}

class _HeartCheckboxState extends State<HeartCheckbox> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState((){
          value = !value;
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Container(

          padding: const EdgeInsets.all(3),
          child: value ? const Icon(
              Icons.favorite,
              color: ColorTable.purple,
            ) :
            const Icon(
              Icons.favorite_border,
              color: ColorTable.purple,
            ),
        ),
      ),
    );
  }
}
