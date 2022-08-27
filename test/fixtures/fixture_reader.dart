import 'dart:io';

class FixtureReader {
  FixtureReader._();
  static final FixtureReader _instance = FixtureReader._();

  static FixtureReader get instance => _instance;

  String read(String name) => File("test/fixtures/$name").readAsStringSync();
}
