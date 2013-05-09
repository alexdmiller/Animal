package;

import massive.munit.Assert;
import animal.core.Entity;
import animal.core.System;
import animal.core.GameBoard;

class SystemTest extends haxe.unit.TestCase {
  var system : DummySystem;
  var goodEntity : Entity;
  var badEntity : Entity;

  @Before
  override public function setup() : Void {
    system = new DummySystem();
    
    goodEntity = new Entity();
    goodEntity.addComponent(new DummyComponent());
    goodEntity.addComponent(new dummypackage.DummyComponent3());

    badEntity = new Entity();
    badEntity.addComponent(new DummyComponent());
  }

  @Test
  public function system_interested_in_entity() {
    Assert.isTrue(system.isInteresed(goodEntity));
  }

  @Test
  public function system_not_interested_in_entity() {
    Assert.isFalse(system.isInteresed(badEntity));
  }
}