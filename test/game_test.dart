import 'package:flutter_test/flutter_test.dart';
import 'package:kart_motoru/kart_motoru.dart';
import 'package:oyun_kontrat_bric/oyun_kontrat_bric.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bridgeConfig.title.length, 33);
    expect(bridgeConfig.tagline.length, 33);
    for (final s in bridgeConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler kazanılabilir ve el sonuna kadar oynanır', () {
    final planner = LevelPlanner(gameId: bridgeId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = bridgeRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      final end = TrickGameRules.simulate(gl.puzzle);
      expect(end.phase, TrickPhase.over, reason: 'bölüm $lv');
    }
  });
}
