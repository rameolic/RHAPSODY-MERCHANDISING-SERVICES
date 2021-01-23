import 'package:geolocator/geolocator.dart';

double lat;
double long;
DateTime now = DateTime.now();

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    try{
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e){
      print(e);
    }
  }
}

void getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.longitude,);
  print(location.latitude);
  lat = location.latitude;
  long = location.longitude;
  print(now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString());
}