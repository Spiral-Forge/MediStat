import 'package:dbapp/models/geometry.dart';

class Place {
  final String name;
  final double rating;
  final int userRatingCount;
  final String vicinity;
  final Geometry geometry;

  Place(
      {this.geometry,
      this.name,
      this.rating,
      this.userRatingCount,
      this.vicinity});

  Place.fromJson(Map<dynamic, dynamic> parsedJson)
      : name = parsedJson['name'],
        rating = (parsedJson['rating'] != null)
            ? parsedJson['rating'].toDouble()
            : null,
        geometry = Geometry.fromJson(parsedJson['geometry']),
        vicinity = parsedJson['vicinity'],
        userRatingCount = (parsedJson['user_ratings_total'] != null)
            ? parsedJson['user_ratings_total']
            : null;
}
