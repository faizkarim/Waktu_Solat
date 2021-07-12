import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:waktusolat/data/model/location_data.dart' as locationDataModel;
import 'package:waktusolat/data/model/mosque.dart';
import 'package:waktusolat/data/repository/mosque_repository.dart';

class MosqueController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final locationData = List<locationDataModel.LocationData>().obs;
  final loading = false.obs;
  MosqueRepository mosqueRepository = MosqueRepository();

  getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    latitude(_locationData.latitude);
    longitude(_locationData.longitude);

    getNearestMosque();
  }

  getNearestMosque() async {
    EasyLoading.show(status: 'Loading...');
    Mosque data = await mosqueRepository.getNearestMosque(
      latitude.value,
      longitude.value,
    );

    if (data != null) {
      locationData.assignAll(data.locationData);
    }
    EasyLoading.dismiss();
  }
}
