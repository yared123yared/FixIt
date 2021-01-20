import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_project/Widgets/CustomFAB.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _currentUserLocation = LatLng(34.0, 3.0);
  List<Marker> myMarker = [];
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getCurrentUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              // flex: 3,
              child: GoogleMap(
                mapType: MapType.hybrid,
                markers: Set.from(myMarker),
                initialCameraPosition: CameraPosition(
                  target: _currentUserLocation,
                  zoom: 14,
                ),
                onTap: _handleTap,
              ),
            ),
            TextField(
              controller: _controller,
              textAlignVertical: TextAlignVertical.bottom,
              onChanged: (value) {
                print(value);
              },
              style: TextStyle(
                fontSize: 20,
                decorationColor: Colors.amberAccent,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                labelText: "Description",
                hintText:
                    "Please write some description of the task to be done here",
                hintStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
              maxLines: 7,
            ),
            RaisedButton(
              onPressed: () {
                print(_controller.text);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.my_location),
                  Text('Auto Detect'),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: CustomFAB(
          onPressed: () async {
            // Navigator.pushNamed(context, '/technician_detail');+
            await _getCurrentUserLocation();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

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
  }

  Future<void> _getCurrentUserLocation() async {
    Position postition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    setState(() {
      _currentUserLocation = LatLng(postition.altitude, postition.latitude);
    });
    print(_currentUserLocation);
  }
}
