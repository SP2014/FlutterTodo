import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ...dependentServices,
  ...independentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [];

List<SingleChildCloneableWidget> dependentServices = [];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  // StreamProvider<ConnectivityStatus>(
  //   create: (context) => locator<ConnectivityService>().connectivity$,
  // ),
];