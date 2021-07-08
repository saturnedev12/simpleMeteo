import 'package:flutter/material.dart';
import 'package:meteo/blocs/data_bloc.dart';
import 'package:meteo/blocs/time_blocs.dart';
import 'package:meteo/blocs/date_bloc.dart';
import 'package:meteo/resources/data_provider.dart';
import 'package:meteo/models/data_model.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/722735.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder<DataModel>(
            stream: streamData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //print(snapshot.data!.name);
                DataModel? data = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          data!.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        Text("${date.day} / ${date.month} / ${date.year}")
                      ],
                    ),
                    Image.network(
                        "http://openweathermap.org/img/wn/${data.weather[0]['icon']}@4x.png"),
                    Column(
                      children: [
                        Text(
                          "${data.main['temp'].round()}°C",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 90,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data.weather[0]['description'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.water_sharp),
                                Text(
                                  " ${data.main['humidity']}%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.visibility),
                                Text(
                                  " ${data.visibility}m",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.air),
                                Text(
                                  " ${data.wind['speed']}km/h",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.anchor),
                                Text(
                                  " ${data.main['pressure']}pa",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: timeBloc(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ],
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
