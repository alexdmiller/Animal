package;

import massive.munit.Assert;
import animal.util.IDPool;

class IDPoolTest extends haxe.unit.TestCase {
  var pool : IDPool;

  @Before
  override public function setup() : Void {
    pool = new IDPool();
  }

  @Test
  public function constructed_pool_open() {
    Assert.isTrue(pool.isFree(0));
    Assert.isTrue(pool.isFree(1));
    Assert.isTrue(pool.isFree(100));
  }
}