import 'package:dbapp/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyCu4dB0gp9KWxG4phEJ_NmyumauuBflrio';

  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=hospital&rankby=distance&key=$key');
    var json = convert.jsonDecode(response.body);
    var hosp = json['results'] as List;
    return hosp.map((place) => Place.fromJson(place)).toList();
  }
}
