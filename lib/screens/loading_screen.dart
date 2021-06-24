import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getLocation()async{
    Position location=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(location);
  }
  @override
  void initState() {
    getLocation();
    super.initState();
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
