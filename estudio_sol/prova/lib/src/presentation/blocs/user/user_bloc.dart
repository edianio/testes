import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/domain/usecases/user/user_picture.dart';
import 'package:prova/src/presentation/blocs/user/user_event.dart';
import 'package:prova/src/presentation/blocs/user/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserPicture picture;

  UserBloc(this.picture) : super(EmptyUserState()){
    on<UserPictureEvent>(_picture, transformer: sequential());
  }

  Future<void> _picture(UserPictureEvent event, Emitter emit) async {
    emit(LoadingUserState());

    await emit.onEach<String>(
      picture.call(),
      onData: (picture){
        emit(LoadedUserPictureState(picture));
      },
      onError: (error, st){
        emit(ExceptionUserState(error.toString()));
      },
    );
  }
}