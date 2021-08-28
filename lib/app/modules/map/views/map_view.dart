import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/theme/app_colors.dart';
import 'package:squeeze/app/widgets/custom_button.dart';
import 'package:squeeze/app_controller.dart';
import 'package:squeeze/generated/locales.g.dart';

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
                    mapType: MapType.satellite,
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: (GoogleMapController cont) {
                      controller.completer.complete(cont);
                    },

                    // markers: <Marker>[
                    //   Marker(
                    //       markerId: MarkerId("asd"),
                    //       position: controller.position),
                    // ].toSet(),
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
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
        text: LocaleKeys.confirm.tr,
        onTap: () {
          if (AppController.to.mainAddress.value == "Select address") {
            Sessions.write(MAIN_ADDRESS, "Jumeirah Beach Residence");
          } else {
            Sessions.write(MAIN_ADDRESS, "Select address");
          }
          Get.back();
        },
        color: secondaryColor,
        width: Get.width * .7,
        height: 50,
      ),
    );
  }
}
