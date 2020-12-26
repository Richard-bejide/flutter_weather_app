import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/city.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      constraints: BoxConstraints.expand(),
      child: SafeArea(
          child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 50.0,
                )),
          ),
          Container(
            padding: EdgeInsets.all(25.0),
            child: TextField(
                decoration: kTextFieldInputDecoration,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                onChanged: (value) {
                  cityName = value;
                }),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context,
                  cityName); //passes cityName back to the previous(location) screen
            },
            child: Text('Get Weather', style: kButtonTextStyle),
          ),
        ],
      )),
    ));
  }
}
