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
    var responseFunction = function(event) {
      Assert.isTrue(true);
    };
    e.on('event', responseFunction);
    e.dispatch('event');
  }

  @Test
  public function singleEvent_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var responseFunction = function(event) {
      Assert.isTrue(true);
    };
    e.off('event', responseFunction);
    e.dispatch('event');
  }

  @Test
  public function singleEvent_on_off_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var responseFunction = function(event) {
      Assert.isTrue(true);
    };
    e.on('event', responseFunction);
    e.off('event', responseFunction);
    e.dispatch('event');
  }

  @Test
  public function singleEvent_on_allOff_dispatch() {
    var e : EventEmitter = new EventEmitter();
    var responseFunction = function(event) {
      Assert.isTrue(true);
    };
    e.on('event', responseFunction);
    e.allOff('event');
    e.dispatch('event');
  }
}