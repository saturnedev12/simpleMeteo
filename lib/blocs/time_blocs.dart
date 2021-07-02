Stream<String> timeBloc() async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    DateTime _now = DateTime.now();
    yield "${_now.hour} : ${_now.minute} : ${_now.second}";
  }
}
