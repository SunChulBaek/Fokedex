import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fokedex/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.kuba_information_icons_set_1).existsSync(), true);
  });
}
