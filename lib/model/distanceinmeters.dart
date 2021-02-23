import 'package:geolocator/geolocator.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/jprequest.dart';
import 'package:merchandising/api/journeyplanapi.dart';





distinmeters() {
  print(todayjplists.storenames);
  for(int u=0;u<todayjplists.outletlat.length;u++){
    double dist = Geolocator.distanceBetween(lat, long, double.parse(todayjplists.outletlat[u]), double.parse(todayjplists.outletlong[u]));
    print(dist);
    todayjplists.distanceinmeters.add(dist/1000);

  }
  }
