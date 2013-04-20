package com.animalsplaygames.animal.test.events;

import  com.animalsplaygames.animal.events.EventEmitter;

class EventEmitterTest extends haxe.unit.TestCase {
  public function test_on_null_throwsError() {
    var e : EventEmitter = new EventEmitter();
    e.on('event', null);
  }

  public function test_singleEvent_listensFor() {
    var e : EventEmitter = new EventEmitter();
    var responseFunction = function(event) {};
    e.on('event', responseFunction);
    assertTrue(e.listensFor('event'));
  }

  public function test_singleEvent_on_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.dispatch('event');
    assertEquals(1, value);
  }

  public function test_singleEvent_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.off('event', responseFunction);
    e.dispatch('event');
    assertEquals(0, value);
  }

  public function test_singleEvent_on_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.off('event', responseFunction);
    e.dispatch('event');
    assertEquals(0, value);
  }

  public function test_singleEvent_on_allOff_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.allOff('event');
    e.dispatch('event');
    assertEquals(0, value);
  }
}