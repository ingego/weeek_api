import 'package:test/test.dart';
import 'package:weeek_api/core/weeek.dart';
import 'package:logger/logger.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('weeek organization', () {
    late Weeek weeek;
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });

    test('get organization', () async {
      var org = await weeek.getOrganization();
      Logger().d(org);
    });
    test('create organization', () async {
      var org = await weeek.createOrganization(
          "test", ["as"], ["1ingego1@gmail.com"], ["phones"]);
      Logger().d(org);
    });
    test('get organization by id', () async {
      var org = await weeek
          .getOrganizationById("092e88f0-e3ae-4da4-bb35-55cf0a329dbc");
      Logger().d(org);
    });
    test('get organization by id', () async {
      var org = await weeek
          .getOrganizationById("092e88f0-e3ae-4da4-bb35-55cf0a329dbc");
      Logger().d(org);
    });

    test('update organization by id', () async {
      var org = await weeek.updateOrganization(
          "092e88f0-e3ae-4da4-bb35-55cf0a329dbc",
          name: "test changes");
      Logger().d(org);
    });
    test('remove organization by id', () async {
      var org = await weeek.removeOrganizationById(
        "878a9716-6237-4f00-a2e6-d5deb9511ae7",
      );
      Logger().d(org);
    });
  });
}
