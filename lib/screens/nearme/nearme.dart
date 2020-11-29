import 'package:dbapp/services/geolocatorservice.dart';
import 'package:dbapp/services/placeservice.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:dbapp/screens/nearme/search.dart';
import 'package:dbapp/models/place.dart';

class NearMe extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation()),
        ProxyProvider<Position, Future<List<Place>>>(
            update: (context, position, places) {
          return (position != null)
              ? placesService.getPlaces(position.latitude, position.longitude)
              : null;
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Search(),
      ),
    );
  }
}
