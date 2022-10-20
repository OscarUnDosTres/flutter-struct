import 'package:rxdart/subjects.dart';
import 'package:undostresflutter/data/repositories/user_repository.dart';

class UserBloc {
  final IUserRepository repository;

  late bool captcha;

  late PublishSubject<bool> _userVerify;
  Stream<bool> get verifyUser => _userVerify.stream;

  late BehaviorSubject<bool> _isLoading;
  Stream<bool> get isLoading => _isLoading.stream;
  // Stream<bool> get verifyUser => _userVerify.stream;

  UserBloc({required this.repository}) {
    captcha = false;
    _userVerify = PublishSubject<bool>();
    _isLoading = BehaviorSubject.seeded(!captcha);
  }

  void captchaCompleted() async {
    captcha = true;
    _isLoading.add(!captcha);
  }

  void verifyExistUser(String userId) async {
    //For captcha completed
    if (!captcha) {
      _userVerify.addError(CaptchaException());
      return;
    }

    _isLoading.add(true);
    late var id;
    try {
      id = int.parse(userId);
    } catch (e) {
      _isLoading.add(false);
      _userVerify.addError(e);
      return;
    }

    _userVerify.addError(LoadingException());
    try {
      repository.verifyUserID(id).then((value) {
        _userVerify.add(value);
        _isLoading.add(false);
      }).catchError((e) {
        _userVerify.addError(e);
        _isLoading.add(false);
      });
    } catch (e) {
      _userVerify.addError(e);
      _isLoading.add(false);
    }
  }

  void dispose() async {
    await _userVerify.drain();
    _userVerify.close();
  }
}

class LoadingException implements Exception {}

class CaptchaException implements Exception {}
