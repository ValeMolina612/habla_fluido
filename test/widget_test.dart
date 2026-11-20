import 'package:flutter_test/flutter_test.dart';
import 'package:habla_fluido/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('la aplicación inicia y muestra el plan diario', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(const HablaFluidoApp());
    await tester.pumpAndSettle();

    expect(find.text('Habla Fluido'), findsOneWidget);
    expect(find.textContaining('Nivel A1'), findsOneWidget);
    expect(find.text('Plan de hoy (20 min)'), findsOneWidget);
    expect(find.textContaining('Repaso espaciado:'), findsOneWidget);
  });
}
