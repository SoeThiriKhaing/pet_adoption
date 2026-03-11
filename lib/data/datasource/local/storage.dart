import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/config.dart';
import '../../../domain/entity/user.dart';
import '../../model/user/user.dart';

abstract class AppStorage {
  Future<void> saveUserInfo(UserEntity user);

  Future<UserEntity?> getSavedUserInfo();

  Future<void> torchAllLocalUserData();


}

@LazySingleton(as: AppStorage)
class AppStorageImpl implements AppStorage {
  final SharedPreferences _prefs;
  final Logger _logger;

  AppStorageImpl(this._prefs, this._logger);

  @override
  Future<void> saveUserInfo(UserEntity user) async {
    await _prefs.setString(
      StorageConfig.userInfoKey,
      jsonEncode(UserModel.fromEntity(user).toJson()),
    );
    _logger.d("Save local UserData: $user");
  }

  @override
  Future<UserEntity?> getSavedUserInfo() async {
    final source = _prefs.getString(StorageConfig.userInfoKey);
    final UserModel? user;
    if (source?.isNotEmpty == true) {
      user = UserModel.fromJson(jsonDecode(source!));
    } else {
      user = null;
    }
    _logger.d("Get local User: $user");
    return user;
  }

  @override
  Future<void> torchAllLocalUserData() async {
    await _prefs.remove(StorageConfig.userInfoKey);
    _logger.d("Remove local UserData");
  }

}
