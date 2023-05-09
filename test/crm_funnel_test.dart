import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:weeek_api/core/weeek.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('crm funnel', () {
    late Weeek weeek;
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });
    test("create funnel", () async {
      var funnel = await weeek.createFunnels("test");
      Logger().d(funnel?.id);
      expect(funnel?.id == null, false);
    });

    test("get all funnels", () async {
      var funnels = await weeek.getAllFunnels();
      Logger().d(funnels);
    });
    test("get funnel by id", () async {
      var funnel = await weeek.getFunnelsById("fMVxsEhxREQbwZJZ");
      Logger().d(funnel);
    });
    test("update funnel", () async {
      await weeek.updateFunnel("fMVxsEhxREQbwZJZ", "update test");
    });
    test("delete funnel", () async {
      await weeek.deleteFunnel("fMVxsEhxREQbwZJZ");
    });
  });
}
