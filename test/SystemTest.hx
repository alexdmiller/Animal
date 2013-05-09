package;

import massive.munit.Assert;
import animal.core.Entity;
import animal.core.System;

class SystemTest extends haxe.unit.TestCase {
  var s : DummySystem;
  var goodEntity : Entity;
  var badEntity : Entity;

  @Before
  override public function setup() : Void {
    s = new DummySystem();
    
    goodEntity = new Entity();
    goodEntity.addComponent(new DummyComponent());
    goodEntity.addComponent(new dummypackage.DummyComponent3());

    badEntity = new Entity();
    badEntity.addComponent(new DummyComponent());
  }

  @Test
  public function system_interested_in_entity() {
    Assert.isTrue(s.isInteresed(goodEntity));
  }

  @Test
  public function system_not_interested_in_entity() {
    Assert.isFalse(s.isInteresed(badEntity));
  }
}