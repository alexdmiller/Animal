package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.Entity;
import animal.serialization.ComponentType;

import systems.PhysicsSystem;
import systems.RenderSystem;
import systems.KeyboardControlSystem;
import systems.ShootingSystem;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    board = new GameBoard();
    board.addSystem(new PhysicsSystem());

    var renderSystem : RenderSystem = new RenderSystem();
    flash.Lib.current.addChild(renderSystem.canvas);
    board.addSystem(renderSystem);

    var keyboardSystem : KeyboardControlSystem = new KeyboardControlSystem(flash.Lib.current.stage);
    board.addSystem(keyboardSystem);

    var shootingSystem : ShootingSystem = new ShootingSystem(flash.Lib.current.stage);
    board.addSystem(shootingSystem);

    var e : Entity = board.createEntity([
      ComponentType.decodeString('{"type": "components.Position", "data": {"x": 10, "y": 100}}'),
      ComponentType.decodeString('{"type": "components.Velocity", "data": {"x": 1, "y": 0.5}}'),
      ComponentType.decodeString('{"type": "components.MaterialProperties", "data": {"friction": 0.9}}'),
      ComponentType.decodeString('{"type": "components.View", "data": {"type": "ship"}}'),
      ComponentType.decodeString('{"type": "components.KeyboardControlled", "data": {"up": 38, "down": 40, "left": 37, "right": 39}}'),
      ComponentType.decodeString('{"type": "components.Shooter"}'),
    ]);

    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}