import 'package:dbapp/models/place.dart';
import 'package:dbapp/services/placeservice.dart';
import 'package:dbapp/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:dbapp/shared/colors.dart';

final myDrawer _drawer = new myDrawer();

class Search extends StatelessWidget {
  @override
  Widget build(context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);
    // final placesProvider = Provider.of<PlacesService>(context , listen:false ).getPlaces;

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: _drawer,
        body: (currentPosition != null)
            ? Consumer<List<Place>>(builder: (_, places, __) {
                print("HELLO");
                // print(places.length);
                print(currentPosition.latitude);
                print(currentPosition.longitude);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 42, 0, 0),
                      child: Row(children: [
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            }),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
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
                            itemCount: places != null ? places.length : 0,
                            itemBuilder: (context, index) {
                              return Card(
                                  child: ListTile(
                                      title: Text(places[index].name)));
                            }))
                    // : Card(
                    //     margin: EdgeInsets.all(16),
                    //     child: Row(
                    //       children: [
                    //         Icon(Icons.error),
                    //         Text(
                    //           "No hospitals found near you",
                    //           style: kSubTextStyle,
                    //         )
                    //       ],
                    //     ),
                    //   )
                  ],
                );
              })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
