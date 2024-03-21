import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/utills/location_handler.dart';

class GoogleMapScreen extends BaseStatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  BaseStatefulWidgetState<GoogleMapScreen> createState() =>
      _GoogleMapScreenState();
}

class _GoogleMapScreenState extends BaseStatefulWidgetState<GoogleMapScreen> {
  late GoogleMapController _googleMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteDark,
      body: SafeArea(
          child: GoogleMap(
        initialCameraPosition: _getInitialCameraPosition(),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        compassEnabled: true,
        zoomControlsEnabled: true,
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getMyLocation();
        },
        backgroundColor: ColorManager.whiteDark,
        child: const Icon(Icons.my_location),
      ),
    );
  }

  _getInitialCameraPosition() {
    return const CameraPosition(
      target: LatLng(20.5937, 78.9629),
      zoom: 12,
    );
  }

  void _getMyLocation() {
    LocationHandler.determinePosition().then((currentPosition) {
      if (currentPosition == null) {
        return;
      }
      _animateCameraToCurrentPosition(currentPosition);
    });
  }

  void _animateCameraToCurrentPosition(Position currentPosition) {
    final cameraPosition = CameraPosition(
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      zoom: 11,
    );
    _googleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
