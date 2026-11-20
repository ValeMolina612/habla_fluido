# Habla Fluido — aprende inglés con un tutor de IA

Flutter + proxy Node + IA generativa + repetición espaciada (Manual TDD, UTNG).

## 1. Preparar la app Flutter
```bash
# dentro de esta carpeta: genera android/ e ios/ sin tocar lib/ ni pubspec.yaml
flutter create . --project-name habla_fluido
flutter pub get
flutter test
flutter run
```

## 2. Permisos (Paso 1.2 del manual)
- **Android** `android/app/src/main/AndroidManifest.xml`, dentro de `<manifest>`:
  ```xml
  <uses-permission android:name="android.permission.RECORD_AUDIO"/>
  <uses-permission android:name="android.permission.INTERNET"/>
  <queries>
    <intent><action android:name="android.speech.RecognitionService"/></intent>
    <intent><action android:name="android.intent.action.TTS_SERVICE"/></intent>
  </queries>
  ```
- **iOS** `ios/Runner/Info.plist`: agrega `NSMicrophoneUsageDescription` y
  `NSSpeechRecognitionUsageDescription` ("Usamos el micrófono para comprobar tu pronunciación").

## 3. Proxy del tutor de IA
```bash
cd proxy
node --test                      # 12 pruebas
export ANTHROPIC_API_KEY=tu_llave
export APP_TOKEN=un_token_cualquiera   # opcional
node server.js
```
Revisa `lib/dependencias.dart` para apuntar la app a la URL de tu proxy
(sin proxy, la app usa el tutor simulado).

## 4. Encender la IA real (opcional) — paso a paso
La app funciona sin esto (tutor simulado). Para la IA real:
1. Instala **Node.js 18 o superior** (https://nodejs.org). No instalas nada más: el proxy no tiene dependencias (no hace falta `npm install`).
2. Crea una llave de API en https://console.anthropic.com (es de pago por uso y distinta a tu suscripción de Claude).
3. En una terminal (PowerShell en Windows):
   ```powershell
   cd proxy
   $env:ANTHROPIC_API_KEY="tu_llave"
   $env:APP_TOKEN="mi_token"          # opcional
   node server.js                      # queda en http://localhost:8787
   ```
   (Mac/Linux: `export ANTHROPIC_API_KEY=tu_llave`.)
4. Corre la app apuntando al proxy:
   - Emulador Android: `flutter run --dart-define=TUTOR_URL=http://10.0.2.2:8787/tutor --dart-define=TUTOR_LOCAL=true --dart-define=TUTOR_TOKEN=mi_token`
   - Teléfono real: usa la IP de tu PC (ej. `http://192.168.1.50:8787/tutor`) en vez de 10.0.2.2, o sube el proxy a un servidor con HTTPS y quita `TUTOR_LOCAL`.
   - Para pruebas con HTTP en Android agrega `android:usesCleartextTraffic="true"` en la etiqueta `<application>` del AndroidManifest.xml (quítalo en producción).
5. El modelo y la URL se cambian con las variables `MODEL` y `UPSTREAM_URL`.
