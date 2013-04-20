package com.animalsplaygames.animal.test.events;

import  com.animalsplaygames.animal.events.EventEmitter;

class EventEmitterTest extends haxe.unit.TestCase {
  public function testSingleEventRegistration() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.dispatch('event');
    assertEquals(value, 1);
  }
}