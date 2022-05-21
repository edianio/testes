import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/usecases/book/all_books.dart';
import 'package:prova/src/domain/usecases/book/book_by_id.dart';
import 'package:prova/src/domain/usecases/book/favorite_books.dart';
import 'package:prova/src/presentation/blocs/book/book_event.dart';
import 'package:prova/src/presentation/blocs/book/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState>{
  final AllBooks all;
  final BookById one;
  final FavoriteBooks favorite;

  BookBloc(this.all, this.one, this.favorite) : super(EmptyBookState()){
    on<AllBooksEvent>(_all, transformer: sequential());
    on<BookByIdEvent>(_one, transformer: sequential());
    on<FavoriteBooksEvent>(_favorite, transformer: sequential());
  }

  Future<void> _all(AllBooksEvent event, Emitter emit) async {
    emit(LoadingBookState());

    await emit.onEach<List<BookEntity>>(
      all.call(),
      onData: (books){
        emit(LoadedBooksState(books));
      },
      onError: (error, st){
        emit(ExceptionBookState(error.toString()));
      },
    );
  }

  Future<void> _one(BookByIdEvent event, Emitter emit) async {
    emit(LoadingBookState());

    try{
      await one.call(event.id).then((book){
        emit(LoadedOneBookState(book));
      });
    } catch(error){
      emit(ExceptionBookState(error.toString()));
    }
  }

  Future<void> _favorite(FavoriteBooksEvent event, Emitter emit) async {
    emit(LoadingBookState());

    await emit.onEach<List<BookEntity>>(
      favorite.call(),
      onData: (books){
        emit(LoadedBooksState(books));
      },
      onError: (error, st){
        emit(ExceptionBookState(error.toString()));
      },
    );
  }
}