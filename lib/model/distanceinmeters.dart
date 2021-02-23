import 'package:geolocator/geolocator.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/api/journeyplanapi.dart';





distinmeters() {
  print(globallist.storenames);
  for(int u=0;u>0;u++){
    double dist = Geolocator.distanceBetween(lat, long, double.parse(globallist.outletlat[u]), double.parse(globallist.outletlong[u]));
    globallist.distanceinmeters.add((dist/1000).toStringAsFixed(2));

  }
  }
