import 'package:dbapp/models/place.dart';
import 'package:dbapp/services/geolocatorservice.dart';
import 'package:dbapp/services/markerservice.dart';
import 'package:dbapp/shared/drawer.dart';
import 'package:dbapp/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:dbapp/shared/colors.dart';
import 'package:url_launcher/url_launcher.dart';

final myDrawer _drawer = new myDrawer();

class Search extends StatelessWidget {
  @override
  Widget build(context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    final geoService = GeoLocatorService();
    final markerService = MarkerService();
    // final placesProvider = Provider.of<PlacesService>(context , listen:false ).getPlaces;

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _drawer,
        body: (currentPosition != null)
            ? Consumer<List<Place>>(builder: (_, places, __) {
                var markers = (places != null)
                    ? markerService.getMarkers(places)
                    : List<Marker>();
                print("HELLO");
                // print(places.length);
                print(currentPosition.latitude);
                print(currentPosition.longitude);
                return (places != null)
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 8),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 42, 0, 0),
                              child: Row(children: [
                                IconButton(
                                    icon: Icon(Icons.menu),
                                    onPressed: () {
                                      _scaffoldKey.currentState.openDrawer();
                                    }),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                                  child: Text(
                                    "Near you",
                                    style: kTitleTextstyle,
                                  ),
                                )
                              ]),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width,
                              child: GoogleMap(
                                markers: Set<Marker>.of(markers),
                                initialCameraPosition: CameraPosition(
                                    target: LatLng(currentPosition.latitude,
                                        currentPosition.longitude),
                                    zoom: 16.0),
                                zoomGesturesEnabled: true,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                              child: Text(
                                "Hospitals around you",
                                style: kTitleTextstyle,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount:
                                        places != null ? places.length : 0,
                                    itemBuilder: (context, index) {
                                      return FutureProvider(
                                        create: (context) =>
                                            geoService.getDistance(
                                                currentPosition.latitude,
                                                places[index]
                                                    .geometry
                                                    .location
                                                    .lat,
                                                currentPosition.longitude,
                                                places[index]
                                                    .geometry
                                                    .location
                                                    .lng),
                                        child: Card(
                                            child: ListTile(
                                          title: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 8.0, 0, 8),
                                            child: Text(places[index].name,
                                                style: kSubTextStyle),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              (places[index].rating != null)
                                                  ? Row(
                                                      children: [
                                                        RatingBarIndicator(
                                                          rating: places[index]
                                                              .rating,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              Icon(Icons.star,
                                                                  color: Colors
                                                                      .amber),
                                                          itemCount: 5,
                                                          itemSize: 12,
                                                          direction:
                                                              Axis.horizontal,
                                                        )
                                                      ],
                                                    )
                                                  : Row(),
                                              Consumer<double>(
                                                builder:
                                                    (context, meters, widget) {
                                                  return (meters != null)
                                                      ? Text(
                                                          '${places[index].vicinity} : ${(meters / 1000).round()} kms')
                                                      : Container();
                                                },
                                              ),
                                              SizedBox(
                                                height: 8,
                                              )
                                            ],
                                          ),
                                          trailing: IconButton(
                                            icon: Icon(Icons.directions),
                                            color: AppColors.mediBlue,
                                            onPressed: () => _launchMapsUrl(
                                                places[index]
                                                    .geometry
                                                    .location
                                                    .lat,
                                                places[index]
                                                    .geometry
                                                    .location
                                                    .lng),
                                          ),
                                        )),
                                      );
                                    }))
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })
            : Center(
                child: Loading(),
              ),
      ),
    );
  }

  void _launchMapsUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }
}
