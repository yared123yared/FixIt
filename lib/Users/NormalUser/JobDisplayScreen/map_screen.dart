import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'map';
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MapScreen> {
  List<Marker> myMarker = [];
  GoogleMapController mapController;
  final LatLng _center = LatLng(9, 38.7);

  LatLng _currentLocation;
  void _onMapCreated(GoogleMapController controller) async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // await centerScreen(position);

    setState(
      () {
        _currentLocation = LatLng(position.latitude, position.longitude);
        print('on map cerrated  $_currentLocation');

        myMarker = [];
        myMarker.add(
          Marker(
            markerId: MarkerId(_currentLocation.toString()),
            position: _currentLocation,
            draggable: true,
            onDragEnd: (value) => _handleTap(_currentLocation),
          ),
        );
      },
    );
    mapController = controller;
  }

  @override
  void initState() {
    GeolocatorService().getCurrentLocation().listen((position) async {
      // await centerScreen(position);
      setState(
        () {
          _currentLocation = LatLng(position.latitude, position.longitude);
          print('iinit  $_currentLocation');
          myMarker = [];
          myMarker.add(
            Marker(
              markerId: MarkerId(_currentLocation.toString()),
              position: _currentLocation,
              draggable: true,
              onDragEnd: (value) => _handleTap(_currentLocation),
            ),
          );
        },
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          markers: Set.from(myMarker),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
          mapType: MapType.satellite,
          onTap: _handleTap,
        ),
        Positioned(
          bottom: 0,
          left: 100,
          child: FlatButton(
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.of(context).pop(LocationArgument(latitude: _currentLocation.latitude.toString(),
                longitude: _currentLocation.longitude.toString()

              ));
            },
            child: Text("Confirm Location",style: TextStyle(
              color: Colors.white
            ),),
          ),
        )
      ]),
    );
  }

  // Future<void> centerScreen(Position position) async {
  //   await mapController.animateCamera(CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //           target: LatLng(position.latitude, position.longitude),
  //           zoom: 18.0)));
  // }

  void _handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        draggable: true,
        onDragEnd: (value) => _handleTap(value),
      ));
      print(tappedPoint);
    });
    // centerScreen(Position(
    //   latitude: _currentLocation.latitude,
    //   longitude: _currentLocation.longitude,
    // ));
  }
}

class GeolocatorService {
  Stream<Position> getCurrentLocation() {
    return Geolocator.getPositionStream(
      desiredAccuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );
  }

  Future<Position> getInitialLocation() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}


class LocationArgument{
  final String latitude;
  final String longitude;

  LocationArgument({this.latitude, this.longitude});
}