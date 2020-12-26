import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utilities/constants.dart';
import 'package:flutter_weather_app/screens/loading_screen.dart';

class OfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '        Not connected to the internet!',
              style: kOfflineStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
                padding: EdgeInsets.only(top: 40.0, left: 45.0),
                child: RaisedButton(
                    elevation: 12.0,
                    highlightElevation: 18.0,
                    child: Text('Reload'),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoadingScreen()));
                    }))
          ],
        )));
  }
}
