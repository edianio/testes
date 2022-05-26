import 'package:prova/src/domain/entities/category_book.dart';

//enum CategoryBook { romance, adventure, comedy, horror, technology, travel }

class CategoryBookModel extends CategoryBookEntity{
  CategoryBookModel({required super.name});

  factory CategoryBookModel.fromMap(Map<String, dynamic> map) =>
  CategoryBookModel(name: map['name'] as String);

  Map<String, dynamic> toMap() => {
    'name': name,
  };

  // factory CategoryBookModel.fromEnum(CategoryBook categoryBook){
  //   switch(categoryBook){
  //     case CategoryBook.romance:
  //       return CategoryBookModel(name: 'Romance');
  //     case CategoryBook.adventure:
  //       return CategoryBookModel(name: 'Aventura');
  //     case CategoryBook.comedy:
  //       return CategoryBookModel(name: 'Comédia');
  //     case CategoryBook.horror:
  //       return CategoryBookModel(name: 'Terror');
  //     case CategoryBook.technology:
  //       return CategoryBookModel(name: 'Tecnologia');
  //     case CategoryBook.travel:
  //       return CategoryBookModel(name: 'Viagem');
  //     default:
  //       return CategoryBookModel(name: 'Nenhum');
  //   }
  // }

  factory CategoryBookModel.fromString(String categoryName){
    switch(categoryName){
      case 'ROMANCE':
        return CategoryBookModel(name: 'Romance');
      case 'ADVENTURE':
        return CategoryBookModel(name: 'Aventura');
      case 'COMEDY':
        return CategoryBookModel(name: 'Comédia');
      case 'HORROR':
        return CategoryBookModel(name: 'Terror');
      case 'TECHNOLOGY':
        return CategoryBookModel(name: 'Tecnologia');
      case 'TRAVEL':
        return CategoryBookModel(name: 'Viagem');
      default:
        return CategoryBookModel(name: 'Todos');
    }
  }
}