import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<double> getDistance(
      double sLat, double eLat, double sLng, double eLng) async {
    return await Geolocator.distanceBetween(sLat, sLng, eLat, eLng);
  }
}
