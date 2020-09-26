import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final double initFabHeight = 120.0;
  double fabHeight;
  double panelHeightOpen;
  double panelHeightClosed = 95.0;

  Completer<GoogleMapController> controller1 = Completer();

  static const LatLng center = const LatLng(29.952764, 31.102079);

  void onMapCreated(GoogleMapController controller) {
    controller1.complete(controller);
  }

  @override
  void initState() {
    super.initState();

    fabHeight = initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(

      body: SlidingUpPanel(
        panel: Center(
          child: Text("This is the sliding Widget"),
        ),

        collapsed: Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: radius
          ),
          child: Center(
            child: Text(
              "This is the collapsed Widget",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        body: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 11.0,
          ),
        ),

        borderRadius: radius,
      ),
    );
  }
}
