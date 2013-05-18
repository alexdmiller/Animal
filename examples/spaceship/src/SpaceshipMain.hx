package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.Entity;
import animal.serialization.ComponentType;

import systems.PhysicsSystem;
import systems.RenderSystem;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    board = new GameBoard();
    board.addSystem(new PhysicsSystem());

    var renderSystem : RenderSystem = new RenderSystem();
    flash.Lib.current.addChild(renderSystem.canvas);
    board.addSystem(renderSystem);

    var e : Entity = board.createEntity([
      ComponentType.decode('{"type": "components.Position", "data": {"x": 10, "y": 100}}'),
      ComponentType.decode('{"type": "components.Velocity", "data": {"x": 1, "y": 0.5}}'),
      ComponentType.decode('{"type": "components.View", "data": {"type": "circle"}}')
    ]);

    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}