import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider implements IUserProvider {
  @override
  Future<http.Response> verifyUserID(int userId) async {
    return http.post(
      Uri.parse('http://test.undostres.com.mx/api/v1/app/isIdValid'),
      body: jsonEncode(<String, int>{'id': userId, 'flag': 1}),
    );
  }

  @override
  Future<http.Response> getUserWallet(int userId) async {
    return http.post(
      Uri.parse('http://test.undostres.com.mx/api/v1/app/cashbackById'),
      body: jsonEncode(<String, int>{'id': userId, 'flag': 1}),
    );
  }
}

abstract class IUserProvider {
  Future<http.Response> verifyUserID(int userId);

  Future<http.Response> getUserWallet(int userId);
}
