import 'package:prova/src/domain/entities/book_entity.dart';

abstract class BookState{}

class EmptyBookState implements BookState{}

class LoadingBookState implements BookState{}

class LoadedBooksState implements BookState{
  final List<BookEntity> books;

  LoadedBooksState(this.books);
}

class LoadedOneBookState implements BookState{
  final BookEntity book;

  LoadedOneBookState(this.book);
}

class ExceptionBookState implements BookState{
  final String error;

  ExceptionBookState(this.error);
}