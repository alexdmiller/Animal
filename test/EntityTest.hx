package;

import massive.munit.Assert;
import animal.core.Entity;

class EntityTest extends haxe.unit.TestCase {
  @Test
  public function constructedEntity() {
    var e : Entity = new Entity(1);
  }
}