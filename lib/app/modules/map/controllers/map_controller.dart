import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  late Completer<GoogleMapController> completer;

  late final CameraPosition kGooglePlex;

  late final CameraPosition kLake;

  var isReady = false;

  late var position;

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  @override
  void onInit() {
    position = LatLng(37.42796133580664, -122.085749655962);
    completer = Completer();
    kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );
    kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );
    super.onInit();
  }

  @override
  void onReady() async {
    await 200.milliseconds.delay();
    isReady = true;
    update();
    super.onReady();
  }

  @override
  void onClose() {}
}
