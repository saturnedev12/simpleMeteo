Stream<String> dateBloc() async* {
  DateTime date = DateTime.now();
  yield "${date.day}, ${date.month}, ${date.isUtc} ${date.year}";
}
