import 'package:equatable/equatable.dart';

class CategoryBookEntity extends Equatable{
  String name;

  CategoryBookEntity({required this.name});

  @override
  List<Object?> get props => [name];
}