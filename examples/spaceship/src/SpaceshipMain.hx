package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.ComponentFactory;
import animal.core.Entity;

import systems.PhysicsSystem;
import components.Position;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    board = new GameBoard();
    board.addSystem(new PhysicsSystem());

    var componentDefinition : Dynamic = {
      type: 'components.Position',
      x: 10,
      y: 100
    };

    var e : Entity = board.createEntity([
      ComponentFactory.makeComponent(componentDefinition)
    ]);

    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}