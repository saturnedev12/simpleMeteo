import 'package:meteo/models/data_model.dart';
import 'package:meteo/resources/data_provider.dart';

Stream<DataModel> streamData() async* {
  while (true) yield await DataProvider().get();
}
