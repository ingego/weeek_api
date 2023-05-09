import 'package:logger/logger.dart';
import 'package:weeek_api/core/weeek.dart';
import 'package:test/test.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('CRM contact', () {
    late Weeek weeek;
    late String id;
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });

    test('get contact', () async {
      var contact = await weeek.getContact();
      Logger().d(contact);
    });
    test('create contact', () async {
      var contact = await weeek.createContact("name", "email", "phone");
      id = contact.id;
      Logger().d(contact);
    });
    test('get contact by id', () async {
      var org = await weeek.getContactById(id);
      Logger().d(org);
    });

    test('update contact by id', () async {
      var org = await weeek.updateContact(id, name: "test changes");
      Logger().d(org);
    });
    test('remove contact by id', () async {
      var org = await weeek.removeContactById(
        id,
      );
      Logger().d(org);
    });
  });
}
