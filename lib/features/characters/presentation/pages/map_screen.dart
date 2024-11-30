import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colombia Map'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          interactionOptions: InteractionOptions(
              flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag, //enable zoom and drag
            ),
          initialCenter: LatLng(4.5709, -74.2973),
          initialZoom: 6,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          const MarkerLayer(
            markers: [
              //Valledupar's market
              Marker(
                point: LatLng(10.4636, -73.2491),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              //Bogota's market
              Marker(
                point: LatLng(4.7110, -74.0721),
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
