```markdown
# 🗺️ Flutter Mapas OSM

Aplicación Flutter que utiliza **OpenStreetMap** y el paquete `flutter_map` para mostrar un mapa con la ubicación actual del usuario.  
Incluye una **barra de búsqueda** que permite localizar direcciones y centrar el mapa en el resultado.

## 🚀 Funcionalidades

- Muestra la ubicación actual del usuario en un mapa OSM.  
- Actualiza la posición en tiempo real con `geolocator`.  
- Permite buscar direcciones con la API de Nominatim.  
- Ícono personalizado del marcador (`assets/marker.png`).  
- Arquitectura basada en **MVVM (Model-View-ViewModel)**.  

## 🧱 Estructura del proyecto

```

lib/
├── models/
│   └── location_model.dart
├── services/
│   └── location_service.dart
├── viewmodels/
│   └── location_viewmodel.dart
└── views/
└── map_view.dart

````

## 🧩 Dependencias principales

- flutter_map  
- geolocator  
- provider  
- latlong2  
- http  

## ▶️ Ejecución

1. Clonar el repositorio:  
   ```bash
   git clone https://github.com/tu-usuario/flutter_mapas_osm.git
````

2. Entrar al directorio del proyecto:

   ```bash
   cd flutter_mapas_osm
   ```
3. Instalar dependencias:

   ```bash
   flutter pub get
   ```
4. Ejecutar el proyecto:

   ```bash
   flutter run
   ```

## 📸 Captura de pantalla

*(Agrega aquí una imagen de tu app en ejecución si querés)*

## 📜 Licencia

Este proyecto se distribuye bajo la licencia [MIT](LICENSE).

```
```
