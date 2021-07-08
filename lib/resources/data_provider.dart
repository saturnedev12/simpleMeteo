import 'package:meteo/resources/data_fetcher.dart';
import 'package:meteo/models/data_model.dart';

//main(List<String> args) async {
//print(DataModel.fromJson(await DataFetcher().fetchData()).toJson());
//}

class DataProvider {
  Future<DataModel> get() async =>
      DataModel.fromJson(await DataFetcher().fetchData());
}
