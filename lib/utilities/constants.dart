import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 130.0,
);

const kCountryStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 45.0,
);
const kTempMagStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 24.0, color: Colors.white70);

const kWeatherTypeStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 38.0,
);
const kWeatherIconStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 70.0,
);
const kCelciusStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);
const kLocationTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 21.0, color: Colors.white70);

const kLoadingStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 40.0,
);

const kOfflineStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Spartan MB',
  fontSize: 24.0,
);

const kErrorStyle = TextStyle(
  color: Colors.black,
  fontFamily: 'Spartan MB',
  fontSize: 15.0,
);
const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 130.0,
);

const kTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),

  filled: true,
  fillColor: Colors.white,
  hintText: "Enter city name",
  hintStyle: TextStyle(color: Colors.grey),
  // icon: Icon(Icons.location_city),
);
