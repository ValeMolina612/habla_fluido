# Habla Fluido

Aplicación Flutter para aprender inglés mediante pronunciación, oído, lectura, escritura, conversación con tutor de IA y repetición espaciada. El proyecto sigue el ciclo TDD descrito en el manual de la materia.

**Repositorio:** [ValeMolina612/habla_fluido](https://github.com/ValeMolina612/habla_fluido)<br>
**Autora y cuenta de GitHub:** `ValeMolina612`<br>
**Tecnologías:** Flutter, Dart, Node.js y API de IA mediante proxy seguro.

## Ciclo TDD aplicado

1. **Fase roja:** se ejecuta una prueba que falla y demuestra el problema.
2. **Fase verde:** se escribe la corrección mínima y todas las pruebas pasan.
3. **Refactorización:** se conserva el comportamiento con la protección de la suite.

### Fase roja real

La prueba de widgets todavía usaba la clase de ejemplo `MyApp`. La aplicación real se llama `HablaFluidoApp`, por lo que Flutter detectó correctamente el error `Couldn't find constructor 'MyApp'`.

![Fase roja real en Visual Studio Code](docs/capturas/01-fase-roja-real.png)

### Fase verde real de Flutter

La prueba fue corregida para iniciar `HablaFluidoApp`, usar preferencias simuladas y comprobar el nivel A1, el plan diario de 20 minutos y el repaso espaciado. Resultado: **79 pruebas aprobadas**.

![79 pruebas Flutter aprobadas en Visual Studio Code](docs/capturas/02-fase-verde-flutter-real.png)

### Fase verde real del proxy

El servidor Node valida solicitudes, respuestas, seguridad del prompt, errores seguros, límite de uso y token de aplicación. Resultado: **12 pruebas aprobadas y 0 fallidas**.

![12 pruebas Node aprobadas en Visual Studio Code](docs/capturas/03-fase-verde-proxy-real.png)

## Pruebas incluidas

| Archivo | Cobertura principal |
|---|---|
| `test/comparador_test.dart` | Normalización, Levenshtein, similitud, palabras correctas, parecidas, sustituidas, omitidas y sobrantes. |
| `test/repaso_progreso_test.dart` | SM-2, fechas, calidad, tarjetas, promedio móvil, racha, nivel y plan diario. |
| `test/tutor_test.dart` | JSON no confiable, tutor simulado, HTTPS, historial, UTF-8 y errores seguros. |
| `test/vms_test.dart` | Pronunciación, dictado, lectura, escritura, conversación, persistencia y repaso. |
| `test/widget_test.dart` | Inicio real de la aplicación y contenido principal de la pantalla. |
| `proxy/test/proxy.test.js` | Prompt, inyección, validación, proveedor de IA, códigos HTTP, rate limit y token. |

Total comprobado: **91 pruebas** — 79 de Flutter y 12 del proxy.

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

Sin configuración adicional, la aplicación utiliza el tutor simulado y no genera costos.

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

## Permisos móviles

Android utiliza permisos de Internet y micrófono. iOS necesita descripciones para el uso del micrófono y el reconocimiento de voz. El audio puede ser procesado por el servicio de voz del sistema, por lo que la aplicación debe informar esta condición al estudiante.

## Estructura

```text
lib/
  datos/          Implementaciones de almacenamiento, tutor y voz
  dominio/        Reglas puras y algoritmos probados
  presentacion/   ViewModels y pantallas Flutter
proxy/            Servidor Node que protege la llave de IA
test/             Pruebas Flutter y Dart
docs/capturas/    Evidencias reales de las fases TDD
```
