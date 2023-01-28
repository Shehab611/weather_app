import 'dart:io';

import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import '../../features/weather_feature/data/repo/weather_home_repo.dart';

Future<void> enableLocationService(Location location) async{
  bool serviceEnabled;
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      exit(0);
    }
  }
}

Future<void>  permitLocationService(Location location) async{
  PermissionStatus permissionGranted;
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      exit(0);
    }
  }
}

Future<String> getCityName(LocationData locationData)async{
  List placeMarks = await geo.placemarkFromCoordinates(locationData.latitude!, locationData.longitude!);
  geo.Placemark place = placeMarks[0];
  String cityName='${place.subAdministrativeArea} , ${place.administrativeArea!.split(' ')[0]}';
  return cityName;
}

Future<City> getLocation() async {
  Location location = Location();
  LocationData locationData;
  locationData = await location.getLocation();
  enableLocationService(location);
  permitLocationService(location);
  String cityName=await getCityName(locationData);
  return City(lat: locationData.latitude!, lon: locationData.longitude!,cityName:cityName);
}