import 'package:equatable/equatable.dart';

//enum CategoryBook { romance, adventure, comedy, horror, technology, travel }

class CategoryBookEntity extends Equatable{
  String name;

  CategoryBookEntity({required this.name});

  @override
  List<Object?> get props => [name];
}