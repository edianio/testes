import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/usecases/book/all_books.dart';
import 'package:prova/src/domain/usecases/book/book_by_id.dart';
import 'package:prova/src/domain/usecases/book/favorite_books.dart';
import 'package:prova/src/presentation/blocs/book/book_bloc.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';

class EntityMock extends Mock implements BookEntity{}
class FavoriteMock extends Mock implements FavoriteBooks{}
class AllMock extends Mock implements AllBooks{}
class OneMock extends Mock implements BookById{}

void main(){
  late FavoriteBooks favorite;
  late AllBooks all;
  late BookById one;
  late BookBloc bloc;
  late BookEntity entity;
  int id = 1;

  setUp((){
    entity = EntityMock();
    favorite = FavoriteMock();
    all = AllMock();
    one = OneMock();
    bloc = BookBloc(all, one, favorite);
  });

  blocTest<BookBloc, BookState>(
    'get favorite books',
    build: (){
      when(() => favorite.call()).thenAnswer((_) => Stream.value([entity]));
      return bloc;
    },
    act: (bloc) => bloc.add(FavoriteBooksEvent()),
    expect: () => [
      isA<LoadingBookState>(),
      isA<LoadedBooksState>(),
    ],
  );

  blocTest<BookBloc, BookState>(
    'get favorite books with error',
    build: (){
      when(() => favorite.call()).thenAnswer((_) => Stream.error(Exception()));
      return bloc;
    },
    act: (bloc) => bloc.add(FavoriteBooksEvent()),
    expect: () => [
      isA<LoadingBookState>(),
      isA<ExceptionBookState>(),
    ],
  );

  blocTest<BookBloc, BookState>(
    'get all books',
    build: (){
      when(() => all.call()).thenAnswer((_) => Stream.value([entity]));
      return bloc;
    },
    act: (bloc) => bloc.add(AllBooksEvent()),
    expect: () => [
      isA<LoadingBookState>(),
      isA<LoadedBooksState>(),
    ],
  );

  blocTest<BookBloc, BookState>(
    'get all books with error',
    build: (){
      when(() => all.call()).thenAnswer((_) => Stream.error(Exception()));
      return bloc;
    },
    act: (bloc) => bloc.add(AllBooksEvent()),
    expect: () => [
      isA<LoadingBookState>(),
      isA<ExceptionBookState>(),
    ],
  );

  blocTest<BookBloc, BookState>(
    'get favorite books',
    build: (){
      when(() => one.call(id)).thenAnswer((invocation) => Future.value(entity));
      return bloc;
    },
    act: (bloc) => bloc.add(BookByIdEvent(id)),
    expect: () => [
      isA<LoadingBookState>(),
      isA<LoadedOneBookState>(),
    ],
  );

  blocTest<BookBloc, BookState>(
    'get favorite books with error',
    build: (){
      when(() => one.call(id)).thenAnswer((invocation) => Future.error(Exception()));
      return bloc;
    },
    act: (bloc) => bloc.add(BookByIdEvent(id)),
    expect: () => [
      isA<LoadingBookState>(),
      isA<ExceptionBookState>(),
    ],
  );
}