package;

import massive.munit.Assert;
import animal.core.EntityTable;
import animal.core.Entity;
import animal.core.Component;

class EntityTableTest extends haxe.unit.TestCase {
  private var testTable : EntityTable;

  @Before
  override public function setup() : Void {
    testTable = new EntityTable();
  }

  @Test
  public function createOneEntity_hasID() {
    var e : Entity = testTable.createEntity();
    Assert.isNotNaN(e.id);
  }

  @Test
  public function createTwoEntities_uniqueIDs() {
    var e1 : Entity = testTable.createEntity();
    var e2 : Entity = testTable.createEntity();    
    Assert.areNotEqual(e1.id, e2.id);
  }

  @Test
  public function createOneEntity_hasComponent() {
    var c : Component = new DummyComponent();
    var e : Entity = testTable.createEntity([c]);
    Assert.areEqual(c, testTable.getComponents(e)[0]);
  }
}