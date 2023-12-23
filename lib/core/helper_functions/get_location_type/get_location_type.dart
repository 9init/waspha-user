import 'package:waspha/core/assets_gen/assets.gen.dart';
import 'package:waspha/core/enums/constants_enums.dart';


LocationType getLocationTypeFromString(String? typeString) {
  switch (typeString?.toUpperCase()) {
    case 'HOME':
      return LocationType.HOME;
    case 'WORK':
      return LocationType.WORK;
    case 'SAFARI':
      return LocationType.BEACH;
    default:
      return LocationType.UNKNOWN;
  }
}
String getSvgImageForLocationType(LocationType locationType) {
  switch (locationType) {
    case LocationType.HOME:
      return MyAssets.images.address.home.path; // Replace with the actual path to your home SVG
    case LocationType.WORK:
      return MyAssets.images.address.work.path; // Replace with the actual path to your work SVG
    case LocationType.BEACH:
      return MyAssets.images.address.beach.path; // Replace with the actual path to your safari SVG
    default:
      return 'assets/unknown.svg'; // Replace with the actual path to your default/unknown SVG
  }
}