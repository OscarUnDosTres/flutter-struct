import 'dart:convert';

import 'package:undostresflutter/data/api/user_provider.dart';

class UserRepository implements IUserRepository {
  IUserProvider provider;

  UserRepository({required this.provider});

  @override
  Future<bool> verifyUserID(int userId) async {
    var res = await provider.verifyUserID(userId);

    if (res.statusCode != 200) {
      if (res.statusCode == 401) {
        return verifyUserID(userId);
      }

      throw Exception(
          'Some Error happened. Please Check your internet connection and try again.');
    }

    try {
      var json = jsonDecode(res.body);

      if (json["data"]["result"]) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

abstract class IUserRepository {
  Future<bool> verifyUserID(int userId);
}
