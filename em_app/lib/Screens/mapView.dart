import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewScreen extends StatefulWidget {
  final String latitude;
  final String longitude;

  MapViewScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewState();
}

class _MapViewState extends State<MapViewScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
              double.parse(widget.latitude), double.parse(widget.longitude)),
          zoom: 12.0,
        ),
      ),
    );
  }
}
