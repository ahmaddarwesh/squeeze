import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';

import '../controllers/map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: GetBuilder<MapController>(
        builder: (_) => Stack(
          children: [
            controller.isReady
                ? GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: (GoogleMapController cont) {
                      controller.completer.complete(cont);
                    },
                    onCameraMove: (location) {
                      l(info: location);
                      controller.position = LatLng(
                          location.target.latitude, location.target.longitude);
                    },
                    onCameraIdle: () {
                      controller.update();
                    },
                    // markers: <Marker>[
                    //   Marker(
                    //       markerId: MarkerId("asd"),
                    //       position: controller.position),
                    // ].toSet(),
                    zoomControlsEnabled: false,
                  )
                : Container(),
            Positioned(
              left: 0,
              right: 0,
              bottom: 40,
              top: 0,
              child: Icon(
                FontAwesome5.map_marker_alt,
                color: Colors.red,
                size: 35,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CButton(
        text: "Confirm",
        onTap: () {
          Get.back();
        },
        color: secondaryColor,
        width: Get.width * .7,
        height: 50,
      ),
    );
  }
}
