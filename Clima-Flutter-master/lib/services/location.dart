import 'package:geolocator/geolocator.dart';

class Locationn {
  double latitude;
  double longitude;

  Future<void> getCurrentLoc() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      this.longitude = position.longitude;
      this.latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
