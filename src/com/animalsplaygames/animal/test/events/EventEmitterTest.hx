package com.animalsplaygames.animal.test.events;

class EventEmitterTest extends haxe.unit.TestCase {
  public function testSingleEventRegistration() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function() {
      value = 1;
    };
    e.on('event', responseFunction);
    e.dispatch('event');
    assertEquals(value, 1);
  }
}