import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

import 'location_screen.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
double latitude;
double longetude;

  var apikey="b8182205d4316687448631dcda94330a";
  @override
  void initState() {
    getLocationData();
    super.initState();
  }
   
void getLocationData() async{
  Location location=Location();
    await location.getLocation();
    latitude=location.latitude;
    longetude=location.longetude;
    NetworkHelper networkHelper=NetworkHelper("https://api.openweathermap.org/data/2.5/find?lat=$latitude&lon=$longetude&cnt=10&appid=$apikey&units=metric");
    var WhetherData=await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (bu)=> LocationScreen(WhetherDa: WhetherData,)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.redAccent,
          size: 200,

        ),
      ),
    );
  }
  

}
