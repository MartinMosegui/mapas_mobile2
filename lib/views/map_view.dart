
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../viewmodels/location_viewmodel.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Cuando la vista se inicia, se llama al ViewModel para obtener la ubicación
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<LocationViewModel>();
      await vm.init();
      vm.startLocationUpdates();
    });
  }

  @override
  void dispose() {
    context.read<LocationViewModel>().stopLocationUpdates();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationViewModel>(
      builder: (context, vm, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Mapa OSM con búsqueda'),
            backgroundColor: Colors.blueAccent,
          ),
          body: SafeArea(
            child: Column(
              children: [
                // 🔍 Barra de búsqueda
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (q) => vm.searchAddress(q),
                          decoration: InputDecoration(
                            hintText: 'Buscar dirección...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () =>
                                  vm.searchAddress(_searchController.text),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🗺️ Mapa principal
                Expanded(
                  child: vm.isLoading || vm.location == null
                      ? const Center(child: CircularProgressIndicator())
                      : FlutterMap(
                          mapController: vm.mapController,
                          options: MapOptions(
                            initialCenter: LatLng(
                              vm.location!.latitude,
                              vm.location!.longitude,
                            ),
                            initialZoom: 16,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                              subdomains: const ['a', 'b', 'c'],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(
                                    vm.location!.latitude,
                                    vm.location!.longitude,
                                  ),
                                  width: 48,
                                  height: 48,
                                  child: Image.asset(
                                    'assets/marker.png',
                                    width: 48,
                                    height: 48,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

