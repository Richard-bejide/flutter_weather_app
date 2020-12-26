import 'package:flutter/material.dart';
import 'package:flutter_weather_app/utilities/constants.dart';
import 'package:flutter_weather_app/services/weather.dart';
import 'package:flutter_weather_app/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  int condition;
  String weatherIcon;
  double longitude;
  double latitude;
  String weatherType;

  int tempMin;
  int tempMax;
  String countryName;
  WeatherModel weather = WeatherModel();

  void updateUI(var weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      cityName = "";
      tempMax = 0;
      tempMin = 0;
      countryName = 'Error';
      longitude = 0;
      latitude = 0;
      weatherType = 'Error';
      return; //ends updateUI()
    }
    setState(() {
      //updates with live weather data
      temperature = (weatherData['main']['temp']).round();
      condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      // weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      longitude = weatherData['coord']['lon'];
      latitude = weatherData['coord']['lat'];
      weatherType = weatherData['weather'][0]['main'];

      tempMin = (weatherData['main']['temp_min']).round();
      tempMax = (weatherData['main']['temp_max']).round();
      countryName = weatherData['sys']['country'];
    });
  }

//initState is called when this object is inserted into the tree(stack).
//The framework will call this method exactly once for each [State] object it creates
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weather.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 38.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      //awaits and stores typed city name from cityScreen(when popped)
                      String typedCityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      //if typedCityName is null it pops back to the initial weatherData
                      if (typedCityName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedCityName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(Icons.location_city, size: 38.0),
                  ),
                ],
              ),
              Text(
                '$cityName,$countryName',
                style: kCountryStyle,
                textAlign: TextAlign.center,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 90.0, top: 30.0, bottom: 2.0),
                  child: Row(children: <Widget>[
                    Text('$temperature',
                        style: kTempTextStyle, textAlign: TextAlign.center),
                    Text('oC',
                        style: kCelciusStyle, textAlign: TextAlign.center),
                  ])),
              Text('Min temp: $tempMin    Max temp: $tempMax',
                  style: kTempMagStyle, textAlign: TextAlign.center),
              Padding(
                  padding: EdgeInsets.only(left: 80.0, top: 20.0),
                  child: Row(children: <Widget>[
                    Text('$weatherType ', style: kWeatherTypeStyle),
                    Text('$weatherIcon', style: kWeatherIconStyle),
                  ])),
              Container(
                  padding: EdgeInsets.only(top: 155.0),
                  width: double.infinity,
                  child: Text('Longitude: $longitude   Latitude: $latitude',
                      style: kLocationTextStyle, textAlign: TextAlign.center))
            ],
          ),
        ),
      ),
    );
  }
}
