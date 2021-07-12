import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:waktusolat/controller/mosque_controller.dart';
import 'package:waktusolat/utils/app_size.dart';

class Mosque extends StatefulWidget {
  @override
  _MosqueState createState() => _MosqueState();
}

class _MosqueState extends State<Mosque> {
  final mosqueController = Get.put(MosqueController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await mosqueController.getLocation();
    });
  }

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Text(
              'Senarai Masjid Berdekatan',
              style: TextStyle(
                fontSize: AppSize.fontLargeX3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              itemCount: mosqueController.locationData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    navigateTo(
                      double.parse(
                          mosqueController.locationData[index].latitud),
                      double.parse(
                          mosqueController.locationData[index].longitud),
                    );
                  },
                  title: Text(
                    mosqueController
                            .locationData[index].namaMasjid.capitalize ??
                        "",
                  ),
                  subtitle: Text(
                    mosqueController.locationData[index].alamat.capitalize,
                  ),
                );
              },
              separatorBuilder: (context, i) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
