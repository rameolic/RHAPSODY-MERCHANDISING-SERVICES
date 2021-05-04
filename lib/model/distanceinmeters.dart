import 'package:geolocator/geolocator.dart';
import 'package:merchandising/model/Location_service.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/jpskippedapi.dart';
import 'package:merchandising/api/Journeyplansapi/todayplan/journeyplanapi.dart';
import 'package:merchandising/Merchandiser/merchandiserscreens/Maps_Veiw.dart';





distinmeters() {
  gettodayjp.distanceinmeters = [];
  for(int u=0;u<gettodayjp.outletlat.length;u++){
    double dist = Geolocator.distanceBetween(lat, long, double.parse(gettodayjp.outletlat[u]), double.parse(gettodayjp.outletlong[u]));
    gettodayjp.distanceinmeters.add(dist/1000);
  }
  print(gettodayjp.distanceinmeters);
  distinmetersforskipjp();
  }
distinmetersforskipjp() {
  todayskipjplist.distanceinmeters=[];
  for(int u=0;u<todayskipjplist.outletlat.length;u++){
    double skippeddist = Geolocator.distanceBetween(lat, long, double.parse(todayskipjplist.outletlat[u]), double.parse(todayskipjplist.outletlong[u]));
    todayskipjplist.distanceinmeters.add(skippeddist/1000);
}
}


