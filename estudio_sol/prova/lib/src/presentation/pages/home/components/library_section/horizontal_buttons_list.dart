import 'package:flutter/material.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/utils/color_table.dart';

class HorizontalButtonsList extends StatelessWidget {
  final List<CategoryBookEntity> categories;

  const HorizontalButtonsList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: NotificationListener<ScrollNotification>(
        onNotification: (_){
          return true;
        },
        child: ListView.builder(
          itemCount: categories.length,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index){
            return Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Flexible(
                child: _myButton(
                  name: categories[index].name,
                  selected: index == 0 ? true : false
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _myButton extends StatefulWidget{
  final String name;
  late bool selected;

  _myButton({required this.name, required this.selected});

  @override
  State<_myButton> createState() => _myButtonState();
}

class _myButtonState extends State<_myButton> {
  Color buttonColor = ColorTable.purple;
  Color fontColor = Colors.white;

  void _changeColor(){
    if(buttonColor == ColorTable.purple) {
      buttonColor = Colors.white;
      fontColor = ColorTable.blackSubTitle;
    } else {
      buttonColor = ColorTable.purple;
      fontColor = Colors.white;
    }
  }

  @override
  void initState(){
    if(!widget.selected){
      _changeColor();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        setState((){
          _changeColor();
        });
      },
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        side: const BorderSide(
          color: ColorTable.blackShadow,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          widget.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
