import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:weeek_api/core/weeek.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('crm funnel status', () {
    late Weeek weeek;
    String idFunnel = "3lQUqD61qJpKpsOr";
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });
    test("create funnel status", () async {
      var funnel = await weeek.createFunnelsStatus(idFunnel, "check test");
      Logger().d(funnel);
      expect(funnel?.id == null, false);
    });

    test("get all funnels statuses", () async {
      var funnels = await weeek.getAllFunnelsStatus(idFunnel);
      Logger().d(funnels);
    });
    test("get funnel status by id", () async {
      var funnel = await weeek.getFunnelsByIdStatus("Snr6wtpi5qNb3cVp");
      Logger().d(funnel);
    });
    test("update funnel status", () async {
      await weeek.updateFunnelStatus("Snr6wtpi5qNb3cVp", "new test");
    });
    test("delete funnel status", () async {
      await weeek.deleteFunnelStatus("Snr6wtpi5qNb3cVp");
    });
  });
}
