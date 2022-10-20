import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider implements IUserProvider {
  @override
  Future<http.Response> verifyUserID(int userId) async {
    return http.post(
      Uri.parse('https://test.undostres.com.mx/api/v1/app/isIdValid'),
      // headers: {
      //   "Content-type": "application/json",
      //   "Accept": "*/*",
      // },
      body: jsonEncode(<String, int>{'id': userId, 'flag': 1}),
    );
  }
}

abstract class IUserProvider {
  Future<http.Response> verifyUserID(int userId);
}
