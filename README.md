# Habla Fluido

### pubspec.yaml
<img width="1517" height="858" alt="image" src="https://github.com/user-attachments/assets/95081446-c70d-48be-a348-808a090c8c91" />

### reglas
 <img width="1508" height="947" alt="image" src="https://github.com/user-attachments/assets/271b0c26-d18a-4698-aa1d-1b60072697c1" />


### nivel 
<img width="1508" height="947" alt="image" src="https://github.com/user-attachments/assets/ef17098b-01d3-4201-9022-f056feb3ab20" />

### exception 
<img width="1467" height="932" alt="image" src="https://github.com/user-attachments/assets/e835930c-fb1b-4a3d-9fff-be8fb7ec2b1b" />


### Fase roja 


![Fase roja real en Visual Studio Code](docs/capturas/01-fase-roja-real.png)

### Fase verde real de Flutter



![79 pruebas Flutter aprobadas en Visual Studio Code](docs/capturas/02-fase-verde-flutter-real.png)


![12 pruebas Node aprobadas en Visual Studio Code](docs/capturas/03-fase-verde-proxy-real.png)



## Ejecutar las pruebas

Desde la carpeta principal:

```powershell
flutter pub get
flutter test
```

Para el proxy:

```powershell
cd proxy
node --test
```

## Ejecutar la aplicación sin IA externa

```powershell
flutter run
```

## Ejecutar con el proxy local

En una primera terminal:

```powershell
cd C:\Users\12251\Downloads\habla_fluido\proxy
$env:ANTHROPIC_API_KEY="tu_llave"
node server.js
```

En otra terminal, desde la carpeta principal:

```powershell
flutter run --dart-define=TUTOR_URL=http://10.0.2.2:8787/tutor --dart-define=TUTOR_LOCAL=true
```

`10.0.2.2` permite que el emulador Android se conecte con el servidor que se ejecuta en la computadora. La llave de la API permanece únicamente en el proxy y nunca debe guardarse en Flutter ni en Git.

