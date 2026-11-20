# Habla Fluido

### pubspec.yaml
<img width="1517" height="858" alt="image" src="https://github.com/user-attachments/assets/95081446-c70d-48be-a348-808a090c8c91" />

### reglas
 <img width="1508" height="947" alt="image" src="https://github.com/user-attachments/assets/271b0c26-d18a-4698-aa1d-1b60072697c1" />


### nivel 
<img width="1508" height="947" alt="image" src="https://github.com/user-attachments/assets/ef17098b-01d3-4201-9022-f056feb3ab20" />

### exception 
<img width="1467" height="932" alt="image" src="https://github.com/user-attachments/assets/e835930c-fb1b-4a3d-9fff-be8fb7ec2b1b" />

## Evidencias por rondas

Las fases rojas se reprodujeron de forma didáctica ejecutando primero cada expectativa sin su implementación. Las fases verdes corresponden a la ejecución real de la solución terminada. Las 20 capturas fueron tomadas en la terminal de Visual Studio Code y muestran la cuenta `ValeMolina612 (GitHub)`.

### Ronda 01 — Inicio de la aplicación

#### 🔴 Fase roja

![Ronda 01 fase roja](docs/capturas/ronda-01-rojo.png)

#### 🟢 Fase verde

La aplicación inicia con `HablaFluidoApp` y muestra el plan diario.

![Ronda 01 fase verde](docs/capturas/ronda-01-verde.png)

### Ronda 02 — Comparación y normalización

#### 🔴 Fase roja

![Ronda 02 fase roja](docs/capturas/ronda-02-rojo.png)

#### 🟢 Fase verde

Se prueban acentos, puntuación, similitud y diferencias entre palabras.

![Ronda 02 fase verde](docs/capturas/ronda-02-verde.png)

### Ronda 03 — Repetición espaciada SM-2

#### 🔴 Fase roja

![Ronda 03 fase roja](docs/capturas/ronda-03-rojo.png)

#### 🟢 Fase verde

Se validan intervalos, calidad de respuesta y fechas de repaso.

![Ronda 03 fase verde](docs/capturas/ronda-03-verde.png)

### Ronda 04 — Progreso y plan diario

#### 🔴 Fase roja

![Ronda 04 fase roja](docs/capturas/ronda-04-rojo.png)

#### 🟢 Fase verde

Se comprueban racha, promedio, nivel y distribución del estudio.

![Ronda 04 fase verde](docs/capturas/ronda-04-verde.png)

### Ronda 05 — Tutor simulado

#### 🔴 Fase roja

![Ronda 05 fase roja](docs/capturas/ronda-05-rojo.png)

#### 🟢 Fase verde

Se valida la respuesta estructurada del tutor y el manejo de datos inválidos.

![Ronda 05 fase verde](docs/capturas/ronda-05-verde.png)

### Ronda 06 — Tutor HTTP y seguridad

#### 🔴 Fase roja

![Ronda 06 fase roja](docs/capturas/ronda-06-rojo.png)

#### 🟢 Fase verde

Se prueban HTTPS, UTF-8, historial, límites y errores seguros.

![Ronda 06 fase verde](docs/capturas/ronda-06-verde.png)

### Ronda 07 — Pronunciación y dictado

#### 🔴 Fase roja

![Ronda 07 fase roja](docs/capturas/ronda-07-rojo.png)

#### 🟢 Fase verde

Se comprueban los ViewModels de voz, pronunciación y oído.

![Ronda 07 fase verde](docs/capturas/ronda-07-verde.png)

### Ronda 08 — Lectura y escritura

#### 🔴 Fase roja

![Ronda 08 fase roja](docs/capturas/ronda-08-rojo.png)

#### 🟢 Fase verde

Se validan respuestas de comprensión y producción escrita.

![Ronda 08 fase verde](docs/capturas/ronda-08-verde.png)

### Ronda 09 — Conversación, aprendizaje y repaso

#### 🔴 Fase roja

![Ronda 09 fase roja](docs/capturas/ronda-09-rojo.png)

#### 🟢 Fase verde

Se prueba conversación, persistencia, avance y tarjetas de repaso.

![Ronda 09 fase verde](docs/capturas/ronda-09-verde.png)

### Ronda 10 — Proxy de inteligencia artificial

#### 🔴 Fase roja

![Ronda 10 fase roja](docs/capturas/ronda-10-rojo.png)

#### 🟢 Fase verde

Se ejecutan las 13 pruebas del proxy: prompt, validación, seguridad, servidor, límite de solicitudes y token.

![Ronda 10 fase verde](docs/capturas/ronda-10-verde.png)


## Pruebas incluidas

| Archivo | Cobertura principal |
|---|---|
| `test/comparador_test.dart` | Normalización, Levenshtein, similitud, palabras correctas, parecidas, sustituidas, omitidas y sobrantes. |
| `test/repaso_progreso_test.dart` | SM-2, fechas, calidad, tarjetas, promedio móvil, racha, nivel y plan diario. |
| `test/tutor_test.dart` | JSON no confiable, tutor simulado, HTTPS, historial, UTF-8 y errores seguros. |
| `test/vms_test.dart` | Pronunciación, dictado, lectura, escritura, conversación, persistencia y repaso. |
| `test/widget_test.dart` | Inicio real de la aplicación y contenido principal de la pantalla. |
| `proxy/test/proxy.test.js` | Prompt, inyección, validación, proveedor de IA, códigos HTTP, rate limit y token. |

Total comprobado: **93 pruebas** — 80 de Flutter y 13 del proxy.

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



