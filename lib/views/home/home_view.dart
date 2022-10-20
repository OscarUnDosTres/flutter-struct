import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/views/home/widgets/home_button.dart';
import 'package:undostresflutter/views/home/widgets/home_services.dart';

import '../../core/utils/service_locator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ServicesBloc _bloc = getIt<ServicesBloc>();

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(width: 8),
            HomeServices(stream: _bloc.allServices),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                  key: Key('load_services_btn'),
                  onPressed: () {
                    _bloc.fetchServices();
                  },
                  child: const Text('Load Services')),
            ),
            HomeButton(
                func: _bloc.addService,
                stream: _bloc.allServices,
                title: "Add Services"),
            HomeButton(
                func: _bloc.removeService,
                stream: _bloc.allServices,
                title: "Remove Service"),
            HomeButton(
                func: _bloc.clearCache,
                stream: _bloc.allServices,
                title: "Clear cache"),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.go("/verify-user-id");
                  },
                  child: const Text('Validar UserID')),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.go("/auth");
                  },
                  child: const Text('Auth')),
            ),
          ],
        ),
      ),
    );
  }
}
