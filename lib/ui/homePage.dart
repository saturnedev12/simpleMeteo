import 'package:flutter/material.dart';
import 'package:meteo/blocs/data_bloc.dart';
import 'package:meteo/blocs/time_blocs.dart';
import 'package:meteo/resources/data_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("meteo app"),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/722735.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            StreamBuilder(
              stream: timeBloc(),
              builder: (context, snapshot) => Text(snapshot.data.toString()),
            ),
            StreamBuilder(
                stream: streamData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Container(),
                    );
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
