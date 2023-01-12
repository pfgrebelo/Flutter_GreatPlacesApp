import './key.dart';

class LocationHelper {
  static String generateLocationPreviewImage(
    double? latitude,
    double? longitude,
  ) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=14&size=400x400&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
