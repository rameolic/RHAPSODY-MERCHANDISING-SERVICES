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

 getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.longitude,);
  print(location.latitude);
  lat = location.latitude;
  long = location.longitude;
  print(now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString());
}

var distInMeters;

Future getDist({var trgtlat,var trgtlong}) async{


  double distanceInMeters = await getLocation().distanceBetween(12.9608, 79.1442,lat,long);//
  print(distInMeters);// lat2 and long2 are global variables with current user's location


}