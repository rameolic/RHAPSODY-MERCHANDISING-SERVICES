import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:merchandising/api/api_service.dart';
import 'package:geocoder/geocoder.dart';
import 'distanceinmeters.dart';
import 'package:location_permissions/location_permissions.dart';
double lat;
double long;
String currentlocation;
var splittime = checkinoutdata.checkintime;
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
   PermissionStatus permission = await LocationPermissions().checkPermissionStatus();
   print('permission : $permission');
  Location location = Location();
  await location.getCurrentLocation();
  lat = location.latitude;
  long =location.longitude;
  distinmeters();
}

address() async {
  final coordinates = new Coordinates(lat,long);
  print(coordinates);
  var addresses = await Geocoder.local.findAddressesFromCoordinates(
      coordinates);
  var first = addresses.first;
  getaddress.currentaddress = '${first.addressLine}';
}

class getaddress {
  static var currentaddress;
}

void SubmitCheckin() {
  address();
  var now = DateTime.now();
  print(now);
  Future.delayed(
      const Duration(seconds: 5), () {
        checkinoutdata.checkintime = DateFormat('HH:mm:ss').format(now);
        print(checkinoutdata.checkintime);
      checkinoutdata.checkinlocation = getaddress.currentaddress;
      //checkin();
  });
}

void SubmitCheckout() async {
  await address();
  var now = DateTime.now();
    checkinoutdata.checkouttime = DateFormat('HH:mm:ss').format(now);
    checkinoutdata.checkoutlocation = getaddress.currentaddress;
    //await checkout();
}

// ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}