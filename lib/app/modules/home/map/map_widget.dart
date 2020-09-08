import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final lat;
  final lng;
  final name;

  const MapWidget({
    @required this.lat,
    @required this.lng,
    @required this.name,
  });

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  GoogleMapController mapController;
  List<Marker> marker = [];
  marcar() {}
  @override
  void initState() {
    super.initState();
    marker.add(
      Marker(
          markerId: MarkerId('service'),
          draggable: false,
          position: LatLng(widget.lat, widget.lng),
          infoWindow: InfoWindow(
            title: widget.name,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
          zoom: 16.0,
        ),
        zoomControlsEnabled: false,
        compassEnabled: false,
        rotateGesturesEnabled: false,
        zoomGesturesEnabled: false,
        scrollGesturesEnabled: false,
        markers: Set.from(marker),
        mapToolbarEnabled: false,
        onMapCreated: (controller) {
          print(widget.lat);
          print(widget.lng);
        },
      ),
    );
  }
}
