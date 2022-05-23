import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/errors/exceptions.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/external/queries/book_queries.dart';
import 'package:prova/src/infra/models/book_model.dart';
import 'package:prova/src/infra/remote/datasource/book_datasource.dart';

class BookDatasourceGraphQl implements BookDatasource{
  final GraphQlService service;

  BookDatasourceGraphQl(this.service);

  @override
  Stream<List<BookEntity>> allBooks() async* {
    final List<BookEntity> books = [];

    try{
      await service.performQuery(allBooksQuery, variables: {}).then((queryResult) {
        final List<dynamic> list = queryResult.data?['allBooks'];
        for(int i=0; i<list.length; i++){
          books.add(BookModel.fromMap(list[i] as Map<String,dynamic>));
        }
        return null;
      });
    } on Exception catch(error){
      print('ERROR: $error');
      throw ServerException();
    }

    yield books;
  }

  @override
  Future<BookEntity> bookById(int id) async {
    late BookEntity book;
    try{
      await service.performQuery(bookQuery, variables: {'id': id}).then((queryResult) {
        book = BookModel.fromMap(queryResult.data?['book'] as Map<String, dynamic>);
      });
    } on Exception catch(error){
      print('ERROR: $error');
      throw ServerException();
    }

    return book;
  }

  @override
  Stream<List<BookEntity>> favoriteBooks() async* {
    final List<BookEntity> books = [];
    
    try{
      await service.performQuery(favoriteBooksQuery, variables: {}).then((queryResult) {
        final List<dynamic> list = queryResult.data?['favoriteBooks'];
        for(int i=0; i<list.length; i++){
          books.add(BookModel.fromMap(list[i] as Map<String,dynamic>));
        }
        return null;
      });
    } on Exception catch(error){
      print('ERROR: $error');
      throw ServerException();
    }
    
    yield books;
  }
}