import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/usecases/user/user_picture.dart';
import 'package:prova/src/presentation/blocs/user/user_bloc.dart';
import 'package:prova/src/presentation/blocs/user/user_event.dart';
import 'package:prova/src/presentation/blocs/user/user_state.dart';

class PictureMock extends Mock implements UserPicture{}

void main(){
  late UserPicture picture;
  late UserBloc bloc;

  setUp((){
    picture = PictureMock();
    bloc = UserBloc(picture);
  });

  blocTest<UserBloc, UserState>(
    'get user picture',
    build: (){
      when(() => picture.call()).thenAnswer((invocation) => Stream.value(''));
      return bloc;
    },
    act: (bloc) => bloc.add(UserPictureEvent()),
    expect: () => [
      isA<LoadingUserState>(),
      isA<LoadedUserPictureState>(),
    ],
  );

  blocTest<UserBloc, UserState>(
    'get user picture with error',
    build: (){
      when(() => picture.call()).thenAnswer((invocation) => Stream.error(Exception()));
      return bloc;
    },
    act: (bloc) => bloc.add(UserPictureEvent()),
    expect: () => [
      isA<LoadingUserState>(),
      isA<ExceptionUserState>(),
    ],
  );
}