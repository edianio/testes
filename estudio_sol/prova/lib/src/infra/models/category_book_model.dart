import 'package:prova/src/domain/entities/category_book.dart';

class CategoryBookModel extends CategoryBookEntity{
  CategoryBookModel({required super.name});

  factory CategoryBookModel.fromMap(Map<String, dynamic> map) =>
  CategoryBookModel(name: map['name'] as String);

  Map<String, dynamic> toMap() => {
    'name': name,
  };
}