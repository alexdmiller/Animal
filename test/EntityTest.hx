package;

import massive.munit.Assert;
import animal.core.Entity;

class EntityTest extends haxe.unit.TestCase {
  var e : Entity;

  @Before
  override public function setup() : Void {
    e = new Entity(1);
  }

  @Test
  public function constructed_entity_has_ID() {
    var e2 : Entity = new Entity(1);
    Assert.areEqual(1, e2.id);
  }

  @Test
  public function addComponent_hasComponent() {
    var c = new DummyComponent();
    var name : String = Type.getClassName(Type.getClass(c));
    e.addComponent(c);
    Assert.isTrue(e.hasComponentWithName(name));
    Assert.areEqual(c, e.getComponentWithName(name));
  }

  @Test
  public function addComponent_dispatches_event() {
    var c = new DummyComponent();
    e.on('component_added', function(event) {
      Assert.isTrue(true);
    });
    e.addComponent(c);
  }

  @Test
  public function removeComponent_dispatches_event() {
    var c = new DummyComponent();
    var name : String = Type.getClassName(Type.getClass(c));
    e.on('component_removed', function(event) {
      Assert.isTrue(true);
    });
    e.addComponent(c);
    e.removeComponentWithName(name);
  }
}