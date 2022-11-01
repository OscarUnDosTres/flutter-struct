import 'package:rxdart/subjects.dart';
import 'package:undostresflutter/data/repositories/user_repository.dart';

class UserBloc {
  final IUserRepository repository;

  late PublishSubject<bool> _userVerify;
  Stream<bool> get verifyUser => _userVerify.stream;

  late PublishSubject<bool> _userVerifyWallet;
  Stream<bool> get verifyUserWallet => _userVerifyWallet.stream;

  late BehaviorSubject<bool> _isLoading;
  Stream<bool> get isLoading => _isLoading.stream;
  // Stream<bool> get verifyUser => _userVerify.stream;

  UserBloc({required this.repository}) {
    _userVerify = PublishSubject<bool>();
    _userVerifyWallet = PublishSubject<bool>();
    _isLoading = BehaviorSubject.seeded(false);
  }

  void verifyExistUser(String userId) async {
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

  void verifyExistUserWallet(String userId) async {
    _isLoading.add(true);
    late var id;
    try {
      id = int.parse(userId);
    } catch (e) {
      _isLoading.add(false);
      _userVerifyWallet.addError(e);
      return;
    }

    _userVerifyWallet.addError(LoadingException());
    try {
      repository.verifyUserWallet(id).then((value) {
        _userVerifyWallet.add(value);
        _isLoading.add(false);
      }).catchError((e) {
        _userVerifyWallet.addError(e);
        _isLoading.add(false);
      });
    } catch (e) {
      _userVerifyWallet.addError(e);
      _isLoading.add(false);
    }
  }

  void disposeWallet() async {
    await _userVerifyWallet.drain();
    _userVerifyWallet.close();
  }
}

class LoadingException implements Exception {}

class CaptchaException implements Exception {}
