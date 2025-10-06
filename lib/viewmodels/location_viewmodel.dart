import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../models/location_model.dart';
import '../services/location_service.dart';

class LocationViewModel extends ChangeNotifier {
LocationModel? _location;
bool _isLoading = true;
final LocationService _service = LocationService();
StreamSubscription<Position>? _posSub;

// MapController compartido para mover el mapa desde aquí
final MapController mapController = MapController();

bool get isLoading => _isLoading;
LocationModel? get location => _location;

Future<void> init() async {
_isLoading = true;
notifyListeners();


final ok = await _service.requestPermission();
if (!ok) {
  _isLoading = false;
  notifyListeners();
  return;
}

final pos = await _service.getCurrentPosition();
if (pos != null) {
  _location = LocationModel(
    latitude: pos.latitude,
    longitude: pos.longitude,
  );
}

_isLoading = false;
notifyListeners();

}

void startLocationUpdates() {
_posSub = _service.positionStream().listen((Position p) {
_location = LocationModel(latitude: p.latitude, longitude: p.longitude);
try {
// intenta mover suavemente el mapa a la nueva posición
mapController.move(LatLng(p.latitude, p.longitude), mapController.camera.zoom);

} catch (_) {}
notifyListeners();
});
}

void stopLocationUpdates() {
_posSub?.cancel();
_posSub = null;
}

/// Busca una dirección en Nominatim (OSM) y centra el mapa en el resultado.
Future<void> searchAddress(String query) async {
if (query.trim().isEmpty) return;
final url = Uri.parse(
  'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(query)}&format=json&limit=1',
);


// OJO: Nominatim exige User-Agent identificable y limite de queries.
final res =
await http.get(url, headers: {'User-Agent': 'flutter_mapas_osm/1.0'});
if (res.statusCode == 200) {
final data = json.decode(res.body);
if (data is List && data.isNotEmpty) {
final item = data[0];
final lat = double.tryParse(item['lat']?.toString() ?? '');
final lon = double.tryParse(item['lon']?.toString() ?? '');
if (lat != null && lon != null) {
_location = LocationModel(latitude: lat, longitude: lon);
mapController.move(LatLng(lat, lon), 16);
notifyListeners();
}
}
}
}
}

