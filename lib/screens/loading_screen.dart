import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocation();
    getData();
    super.initState();
  }
  void getData()async{

    http.Response response=await http.get("https://api.openweathermap.org/data/2.5/find?lat=20.9&lon=76.2&cnt=10&appid=b8182205d4316687448631dcda94330a");
    if(response.statusCode==200){
      String data=response.body;
     var json=jsonDecode(data);
     print(json['message']);
    }else{

    }

  }
  
void getLocation() async{
  Location location=Location();
    await location.getLocation();
    print(location.longetude);
    print(location.latitude);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
  

}
