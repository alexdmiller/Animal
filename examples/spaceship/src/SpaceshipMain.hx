package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.Entity;

import systems.PhysicsSystem;
import components.Position;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    board = new GameBoard();
    board.addSystem(new PhysicsSystem());

    var p : Position = new Position();
    p.x = 10;
    p.y = 100;
    var e : Entity = board.createEntity([p]);

    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}