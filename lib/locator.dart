import 'package:flutter_anime_flix/services/helpers/network.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(NetworkService());
}
