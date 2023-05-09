import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:weeek_api/core/weeek.dart';
import 'package:weeek_api/models/deal.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('crm funnel status', () {
    late Weeek weeek;
    String idFunnel = "3lQUqD61qJpKpsOr";
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });
    test("create Deal", () async {
      var deal = await weeek.createDeal(
          "xFxVIGH0jetVRvTG",
          Deal(
            title: "test",
          ));
      Logger().d(deal);
      expect(deal.id == null, false);
    });

    test("get deals", () async {
      var deals = await weeek.getDeals("xFxVIGH0jetVRvTG");
      Logger().d(deals);
    });
    test("get deal by id", () async {
      var deal = await weeek.getDealById("GHeDmS2g9BoAAT3b");
      Logger().d(deal);
    });
    test("update deal", () async {
      var deal = await weeek.updateDeal(
          "GHeDmS2g9BoAAT3b", Deal(description: "update test desc"));
    });
    test("delete deal", () async {
      await weeek.deleteDealById("GHeDmS2g9BoAAT3b");
    });
    test("move deal", () async {
      await weeek.moveDealById("GHeDmS2g9BoAAT3b", "OX9ZzDKyn3OaxgTg");
    });
  });
}
