import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

double lat;
double long;
final  timenow =DateFormat("h:mma").format(DateTime.now());

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

 getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.longitude);
  print(location.latitude);
  lat = location.latitude;
  long =location.longitude;
   print(timenow);
}
