package com.animalsplaygames.animal.test;

class TestMain {
  static function main() {
    var r = new haxe.unit.TestRunner();
    r.add(new com.animalsplaygames.animal.test.events.EventEmitterTest());
    r.run();
  }
}