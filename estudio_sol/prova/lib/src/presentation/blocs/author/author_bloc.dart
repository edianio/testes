import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/usecases/author/favorite_authors.dart';
import 'package:prova/src/presentation/blocs/author/author_event.dart';
import 'package:prova/src/presentation/blocs/author/author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState>{
  final FavoriteAuthors favorites;

  AuthorBloc(this.favorites) : super(EmptyAuthorState()){
    on<FavoriteAuthorsEvent>(_favorites, transformer: sequential());
  }

  Future<void> _favorites(FavoriteAuthorsEvent event, Emitter emit) async {
    emit(LoadingAuthorState());

    await emit.onEach<List<AuthorEntity>>(
      favorites.call(),
      onData: (authors){
        emit(LoadedAuthorState(authors));
      },
      onError: (error, st){
        emit(ExceptionAuthorState(error.toString()));
      },
    );
  }
}