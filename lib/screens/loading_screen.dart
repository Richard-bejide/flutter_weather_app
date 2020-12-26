import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather_app/services/weather.dart';
import 'package:flutter_weather_app/utilities/constants.dart';
import 'package:flutter_weather_app/screens/offline_screen.dart';
import 'package:connectivity_widget/connectivity_widget.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    bool phoneConnection = await ConnectivityUtils.instance
        .isPhoneConnected(); // gets the current status of the network

    if (phoneConnection == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OfflineScreen()));
      return;
    }

    var weatherData = await WeatherModel().getLocationWeather();
    //called when the location and weatherData have been gotten
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

//initState is called when this object is inserted into the tree(stack).
//The framework will call this method exactly once for each [State] object it creates.
  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Flutter Weather', style: kLoadingStyle),
        Container(
            child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        )),
      ],
    )));
  }
}
