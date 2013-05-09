package;

import massive.munit.Assert;
import animal.core.Entity;
import animal.core.System;
import animal.core.GameBoard;

class SystemGameBoardIntegrationTest extends haxe.unit.TestCase {
  var board : GameBoard;
  var system : DummySystem;
  var goodEntity : Entity;
  var badEntity : Entity;

  @Before
  override public function setup() : Void {
    board = new GameBoard();
    system = new DummySystem();

    goodEntity = board.createEntity([new DummyComponent(),new dummypackage.DummyComponent3()]);
    badEntity = board.createEntity([new DummyComponent()]);
  }

  @Test
  public function system_adds_entity_when_added_to_board() {
    board.addSystem(system);
    Assert.areEqual(1, system.getEntities().length);
  }
}