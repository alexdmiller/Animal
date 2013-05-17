package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.Entity;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    board = new GameBoard();
    board.addSystem(new PhysicsSystem());
    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}