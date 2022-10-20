import 'package:flutter/material.dart';
import 'package:undostresflutter/blocs/user_bloc.dart';
import 'package:undostresflutter/data/api/user_provider.dart';
import 'package:undostresflutter/data/repositories/user_repository.dart';

class UserIdView extends StatefulWidget {
  const UserIdView({super.key});

  @override
  State<UserIdView> createState() => _UserIdView();
}

class _UserIdView extends State<UserIdView> {
  final UserBloc _bloc =
      UserBloc(repository: UserRepository(provider: UserProvider()));
  final controller = TextEditingController();

  bool _isButtonDisabled = false;

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/images/undostres_logo.png'),
          width: 180,
        ),
      ),
      body: Column(children: <Widget>[
        const Text("Insert User ID"),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: controller,
            obscureText: false,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'User ID'),
          ),
        ),
        StreamBuilder(
            stream: _bloc.isLoading,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ElevatedButton(
                    onPressed: snapshot.data as bool
                        ? null
                        : () {
                            _bloc.verifyExistUser(controller.text);
                          },
                    child: const Text('Verificar'));
              } else {
                return ElevatedButton(
                    onPressed: () {
                      _bloc.verifyExistUser(controller.text);
                    },
                    child: const Text('Verificar'));
              }
            }),
        StreamBuilder(
            stream: _bloc.verifyUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _isButtonDisabled = false;
                var exists = snapshot.data as bool;
                if (exists) {
                  return const Text("The user ID is valid");
                } else {
                  return const Text("The user Id is NOT valid");
                }
              } else if (snapshot.hasError) {
                if (snapshot.error is LoadingException) {
                  return const Text("verifying userid please wait.");
                } else if (snapshot.error is FormatException) {
                  _isButtonDisabled = false;
                  return const Text("The given id is not a valid integer");
                } else {
                  _isButtonDisabled = false;
                  return Text(snapshot.error.toString());
                }
              } else {
                return const SizedBox.shrink();
              }
            })
      ]),
    );
  }
}
