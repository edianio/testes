import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  String userPicture;

  UserEntity({required this.userPicture});

  @override
  List<Object?> get props => [ userPicture ];
}