import 'package:meteo/resources/data_provider.dart';

Stream streamData() async* {
  while (true) {
    yield DataProvider().get();
  }
}
