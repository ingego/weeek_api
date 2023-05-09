import 'package:weeek_api/core/weeek.dart';
import 'package:test/test.dart';
import 'package:weeek_api/testkey.dart';

void main() {
  group('weeek api', () {
    late Weeek weeek;
    setUp(() async {
      await Weeek.init(token);
      weeek = Weeek.getInstance();
    });
  });
}
