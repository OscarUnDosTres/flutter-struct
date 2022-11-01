import 'dart:convert';
import 'dart:developer';

import 'package:undostresflutter/data/api/user_provider.dart';

class UserRepository implements IUserRepository {
  IUserProvider provider;

  UserRepository({required this.provider});

  @override
  Future<bool> verifyUserID(int userId, {bool retry = false}) async {
    var res = await provider.verifyUserID(userId);

    if (res.statusCode != 200) {
      if (res.statusCode == 401 && !retry) {
        return verifyUserID(userId, retry: true);
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

  @override
  Future<double> getUserWallet(int userId, {bool retry = false}) async {
    var res = await provider.getUserWallet(userId);

    if (res.statusCode != 200) {
      if (res.statusCode == 401 && !retry) {
        return getUserWallet(userId, retry: true);
      }

      throw Exception(
          'Some Error happened. Please Check your internet connection and try again.');
    }

    try {
      var json = jsonDecode(res.body);

      if (json["data"]["result"] != false) {
        //////////////////// todo: getting number as result and sending it
        var wallet = double.parse(json["data"]["result"]);
        print(wallet);
        return wallet;
      } else {
        return -1.0;
      }
    } catch (e) {
      return -1.0;
    }
  }
}

abstract class IUserRepository {
  Future<bool> verifyUserID(int userId);

  Future<double> getUserWallet(int userId);
}
