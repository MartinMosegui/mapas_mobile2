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

<img width="1295" height="877" alt="image" src="https://github.com/user-attachments/assets/5d4b9336-0ce9-4fc5-b245-997698588239" />


## 📜 Licencia


MIT License

Copyright (c) 2025 Juan Mosegui

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

.



