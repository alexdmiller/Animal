package;

import flash.events.Event;

import animal.core.GameBoard;
import animal.core.Entity;
import animal.serialization.ComponentSerialize;
import animal.serialization.GameBoardSerialize;

import systems.PhysicsSystem;
import systems.RenderSystem;
import systems.KeyboardControlSystem;
import systems.ShootingSystem;

class SpaceshipMain {
  private static var board : GameBoard;

  public static function main() {
    var boardDef : String = haxe.Resource.getString("board.json");
    board = GameBoardSerialize.decodeString(boardDef);

    board.addSystem(new PhysicsSystem());
    var renderSystem : RenderSystem = new RenderSystem();
    flash.Lib.current.addChild(renderSystem.canvas);
    board.addSystem(renderSystem);
    var keyboardSystem : KeyboardControlSystem = new KeyboardControlSystem(flash.Lib.current.stage);
    board.addSystem(keyboardSystem);
    var shootingSystem : ShootingSystem = new ShootingSystem(flash.Lib.current.stage);
    board.addSystem(shootingSystem);

    flash.Lib.current.addEventListener(Event.ENTER_FRAME, onEnterFrame);
  }

  private static function onEnterFrame(e : Event) {
    board.update(1);
  }
}