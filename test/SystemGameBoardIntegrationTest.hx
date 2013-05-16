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

    goodEntity = board.createEntity([new DummyComponent(), new dummypackage.DummyComponent3()]);
    badEntity = board.createEntity([new DummyComponent()]);
  }

  @Test
  public function system_adds_entity_when_added_to_board() {
    board.addSystem(system);
    Assert.isTrue(system.containsEntity(goodEntity));
  }

  @Test
  public function system_does_not_add_entity_when_added_to_board() {
    board.addSystem(system);
    Assert.isFalse(system.containsEntity(badEntity));
  }

  @Test
  public function system_removes_entity_removed_from_board() {
    board.addSystem(system);
    board.removeEntity(goodEntity);
    Assert.isFalse(system.containsEntity(goodEntity));
  }

  @Test
  public function system_adds_entity_that_changed_components() {
    board.addSystem(system);
    badEntity.addComponent(new dummypackage.DummyComponent3());
    Assert.isTrue(system.containsEntity(badEntity));
  }

  @Test
  public function system_remove_entity_that_changed_components() {
    board.addSystem(system);
    goodEntity.removeComponentWithName('DummyComponent');
    Assert.isFalse(system.containsEntity(goodEntity));
  }

  @Test
  public function system_receives_board_update() {
    board.addSystem(system);
    system.on('updated', function(event : Dynamic) {
      Assert.areEqual(1, event.delta);
    });
    board.update(1);
  }

  @Test
  public function system_removed_from_board_throws_event() {
    board.addSystem(system);
    system.on('removed_from_board', function(event : Dynamic) {
      Assert.isTrue(true);
    });
    board.removeSystem(system);
  }
}