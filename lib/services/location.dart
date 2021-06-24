import 'package:geolocator/geolocator.dart';
class Location {
  double latitude;
  double longetude;

 Future<void> getLocation() async {
    try {
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=location.latitude;
      longetude=location.longitude;
    } catch (e) {
      print(e);
    }
  }
}