import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/usecases/author/favorite_authors.dart';
import 'package:prova/src/presentation/blocs/author/author_bloc.dart';
import 'package:prova/src/presentation/blocs/author/author_event.dart';
import 'package:prova/src/presentation/blocs/author/author_state.dart';

class EntityMock extends Mock implements AuthorEntity{}
class FavoriteMock extends Mock implements FavoriteAuthors{}

void main(){
  late FavoriteAuthors favoriteAuthors;
  late AuthorBloc bloc;
  late AuthorEntity entity;

  setUp((){
    entity = EntityMock();
    favoriteAuthors = FavoriteMock();
    bloc = AuthorBloc(favoriteAuthors);
  });

  blocTest<AuthorBloc, AuthorState>(
    'get favorite authors',
    build: (){
      when(() => favoriteAuthors.call()).thenAnswer((invocation) => Stream.value([entity]));
      return bloc;
    },
    act: (bloc) => bloc.add(FavoriteAuthorsEvent()),
    expect: () => [
      isA<LoadingAuthorState>(),
      isA<LoadedAuthorState>(),
    ],
  );

  blocTest<AuthorBloc, AuthorState>(
    'get favorite authors with error',
    build: (){
      when(() => favoriteAuthors.call()).thenAnswer((invocation) => Stream.error(Exception()));
      return bloc;
    },
    act: (bloc) => bloc.add(FavoriteAuthorsEvent()),
    expect: () => [
      isA<LoadingAuthorState>(),
      isA<ExceptionAuthorState>(),
    ],
  );
}