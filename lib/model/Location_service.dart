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
class Locationclass {
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

 Future<bool> getLocation() async {
   try{
       Locationclass location = Locationclass();
       await location.getCurrentLocation();
       lat = location.latitude;
       long = location.longitude;
       distinmeters();
       return lat==null?false:true;
   }catch(e){
     print(e);
   }
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

 SubmitCheckin() async {
  await getLocation();
  await address();
  var now = DateTime.now();
  print(now);
  checkinoutdata.checkintime = DateFormat('HH:mm:ss').format(now);
  print(checkinoutdata.checkintime);
  checkinoutdata.checkinlocation = "${getaddress.currentaddress}($lat,$long)";
  await checkin();
}

 SubmitCheckout() async {
  await address();
  var now = DateTime.now();
    checkinoutdata.checkouttime = DateFormat('HH:mm:ss').format(now);
    checkinoutdata.checkoutlocation = "${getaddress.currentaddress}($lat,$long)";
    await checkout();
}

// ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}