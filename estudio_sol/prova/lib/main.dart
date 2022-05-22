import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:prova/src/app_widget.dart';

void main() async {
  await initHiveForFlutter();

  runApp(const AppWidget());
}