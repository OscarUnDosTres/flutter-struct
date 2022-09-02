import 'package:get_it/get_it.dart';
import 'package:undostresflutter/blocs/services_bloc.dart';
import 'package:undostresflutter/data/api/services_provider.dart';
import 'package:undostresflutter/data/repositories/services_repository.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ServicesBloc>(ServicesBloc(
      repository: ServicesRepository(provider: ServicesProvider())));
}
