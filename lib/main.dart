import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/location_viewmodel.dart';
import 'views/map_view.dart';

void main() {
runApp(const MainApp());
}

class MainApp extends StatelessWidget {
const MainApp({super.key});

@override
Widget build(BuildContext context) {
return ChangeNotifierProvider(
create: (_) => LocationViewModel(),
child: const MaterialApp(
home: MapView(),
debugShowCheckedModeBanner: false,
),
);
}
}
