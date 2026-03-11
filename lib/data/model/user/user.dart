
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entity/user.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserModel with _$UserModel implements UserEntity {
  const factory UserModel({
    required String id,
    required String email,
    required String name,
    String? profileUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      profileUrl: user.profileUrl,
    );
  }

  factory UserModel.fromFirebaseDocument(DocumentSnapshot document) {
    return UserModel(
      id: document.id,
      email: document.get('email'),
      name: document.get('name'),
    );
  }
}