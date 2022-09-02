import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/views/home/widgets/home_card.dart';

import '../../core/utils/service_locator.dart';
import '../../data/models/services.dart';
import '../../data/repositories/services_repository.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ServicesBloc _bloc = getIt<ServicesBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.fetchServices();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
            StreamBuilder(
                stream: _bloc.allServices,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var services = snapshot.data as List<Service>;
                    if (services.isEmpty) {
                      return Text("Loading....");
                    } else {
                      return ListView.builder(
                          itemCount: services.length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemBuilder: (((context, index) {
                            return HomeCard(service: services[index]);
                          })));
                    }
                  } else if (snapshot.hasError) {
                    return Text("Error");
                  } else {
                    return Text("Loading....");
                  }
                }),
            const SizedBox(height: 10),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "Home View",
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
