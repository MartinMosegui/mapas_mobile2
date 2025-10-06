import 'package:geolocator/geolocator.dart';

class LocationService {
/// Pide permisos y devuelve true si están OK y el servicio de ubicación está habilitado
Future<bool> requestPermission() async {
bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
if (!serviceEnabled) {
// el usuario tiene el servicio de ubicación desactivado
return false;
}


LocationPermission permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    return false;
  }
}

if (permission == LocationPermission.deniedForever) {
  // permisos bloqueados permanentemente
  return false;
}

return true;


}

/// Obtener la posición actual (o null si falla)
Future<Position?> getCurrentPosition() async {
try {
return await Geolocator.getCurrentPosition(
desiredAccuracy: LocationAccuracy.best,
);
} catch (e) {
return null;
}
}


Stream<Position> positionStream({int distanceFilter = 5}) {
return Geolocator.getPositionStream(
locationSettings: LocationSettings(
accuracy: LocationAccuracy.best,
distanceFilter: distanceFilter,
),
);
}
}
