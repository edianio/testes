import 'package:prova/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.userPicture});

  factory UserModel.fromMap(Map<String, dynamic> map) =>
      UserModel(userPicture: map['userPicture'] as String);

  Map<String, dynamic> toMap() => {
    'userPicture': userPicture
  };
}