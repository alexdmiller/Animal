package;

import massive.munit.Assert;
import animal.events.EventEmitter;

class EventEmitterTest extends haxe.unit.TestCase {
  @Test
  public function singleEvent_listensFor() {
    var e : EventEmitter = new EventEmitter();
    var responseFunction = function(event) {};
    e.on('event', responseFunction);
    Assert.isTrue(e.listensFor('event'));
  }

  @Test
  public function singleEvent_on_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.dispatch('event');
    Assert.areEqual(value, 1);
  }

  @Test
  public function singleEvent_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.off('event', responseFunction);
    e.dispatch('event');
    Assert.areEqual(value, 0);
  }

  @Test
  public function singleEvent_on_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.off('event', responseFunction);
    e.dispatch('event');
    Assert.areEqual(value, 0);
  }

  @Test
  public function singleEvent_on_allOff_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var value : Int = 0;
    var responseFunction = function(event) {
      value = 1;
    };
    e.on('event', responseFunction);
    e.allOff('event');
    e.dispatch('event');
    Assert.areEqual(value, 0);
  }
}