import 'package:http/http.dart' as http;

class UserProvider implements IUserProvider {
  @override
  Future<http.Response> verifyUserID(int userId) async {
    return http.get(
        Uri.parse('https://sanbox.undostres.com.mx/verify-user-id/$userId'));
  }
}

abstract class IUserProvider {
  Future<http.Response> verifyUserID(int userId);
}
