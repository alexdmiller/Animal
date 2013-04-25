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
  public function createOneEntity_hasComponent() {
    var c : Component = new DummyComponent();
    var e : Entity = testTable.createEntity([c]);
    Assert.areEqual(c, testTable.getComponents(e)[0]);
  }

  @Test
  public function oneEntity_twoComponents() {
    var c1 : Component = new DummyComponent();
    var c2 : Component = new DummyComponent();
    var e : Entity = testTable.createEntity([c1, c2]);
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c1));
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c2));
  }

  @Test
  public function createTwoEntities_uniqueIDs() {
    var e1 : Entity = testTable.createEntity();
    var e2 : Entity = testTable.createEntity();    
    Assert.areNotEqual(e1.id, e2.id);
  }

  @Test
  public function createTwoEntities_hasComponent() {
    var c1 : Component = new DummyComponent();
    var c2 : Component = new DummyComponent();
    var e1 : Entity = testTable.createEntity([c1]);
    var e2 : Entity = testTable.createEntity([c2]);
    Assert.areEqual(c1, testTable.getComponents(e1)[0]);
    Assert.areEqual(c2, testTable.getComponents(e2)[0]);
    Assert.areNotEqual(c1, testTable.getComponents(e2)[0]);
    Assert.areNotEqual(c2, testTable.getComponents(e1)[0]);
  }

  @Test
  public function addComponentsToEntity_singleComponent() {
    var c1 : Component = new DummyComponent();
    var c2 : Component = new DummyComponent();
    var e : Entity = testTable.createEntity([c1]);
    testTable.addComponentsToEntity(e, [c2]);
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c1));
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c2));
  }

    @Test
  public function addComponentsToEntity_twoComponents() {
    var c1 : Component = new DummyComponent();
    var c2 : Component = new DummyComponent();
    var c3 : Component = new DummyComponent();
    var e : Entity = testTable.createEntity([c1]);
    testTable.addComponentsToEntity(e, [c2, c3]);
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c1));
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c2));
    Assert.isTrue(Lambda.has(testTable.getComponents(e), c3));
  }
}