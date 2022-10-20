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
                    child: const Text('Enviar'));
              } else {
                return ElevatedButton(
                    onPressed: () {
                      _bloc.verifyExistUser(controller.text);
                    },
                    child: const Text('Enviar'));
              }
            }),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
            stream: _bloc.verifyUser,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _isButtonDisabled = false;
                var exists = snapshot.data as bool;
                if (exists) {
                  return const Text("El usuario existe en db");
                } else {
                  return const Text("El usuario no existe en db");
                }
              } else if (snapshot.hasError) {
                if (snapshot.error is LoadingException) {
                  return const Text("Verificando usuario porfavor espere.");
                } else if (snapshot.error is FormatException) {
                  _isButtonDisabled = false;
                  return const Text("El ID no es Valido");
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
