import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:mobile_nsk/core/contacts/contacts_map_controller.dart';
import 'package:mobile_nsk/models/contacts/contacts_model.dart';
import 'package:mobile_nsk/pages/widgets/loading_view.dart';
import 'package:mobile_nsk/shared/theme.dart';

class ContactsMap extends GetView<ContactsMapController> {
  ContactsMap({Key? key, required this.offices}) : super(key: key);
  final List<Contacts> offices;

  final controller = Get.put(ContactsMapController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loadRx.value
          ? LoadingView()
          : Scaffold(
              body: FlutterMap(
                options: MapOptions(
                  center: latlng.LatLng(43.238949, 76.889709),
                  zoom: 13,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    rotate: true,
                    markers: [
                      Marker(
                        point: latlng.LatLng(
                            controller.location.value!.latitude,
                            controller.location.value!.longitude),
                        builder: (_) => Icon(
                          Icons.person,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      ...List.generate(
                        offices.length,
                        (index) {
                          final long = offices[index].longitude;
                          final lat = offices[index].latitude;
                          return Marker(
                            point: latlng.LatLng(
                              long == "" ? 0.0 : double.parse(long!),
                              lat == "" ? 0.0 : double.parse(lat!),
                            ),
                            builder: (ctx) => GestureDetector(
                              onTap: () => controller.showInfo(
                                offices[index],
                                ctx,
                              ),
                              child: Icon(
                                Icons.location_on,
                                color: AppColors.primary,
                                size: 35,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
