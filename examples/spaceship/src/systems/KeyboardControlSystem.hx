package systems;

import flash.display.DisplayObjectContainer;
import flash.events.KeyboardEvent;

import animal.core.System;
import animal.core.Entity;
import components.Position;
import components.Velocity;
import components.KeyboardControlled;


class KeyboardControlSystem extends System {
  private var keys : Array<Bool>;

  public function new(stage : DisplayObjectContainer) {
    super(['components.KeyboardControlled', 'components.Velocity']);
    stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
    stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
    keys = new Array<Bool>();
  }

  private function onKeyDown(event : KeyboardEvent) : Void {
    keys[event.keyCode] = true;
  }

  private function onKeyUp(event : KeyboardEvent) : Void {
    keys[event.keyCode] = false;
  }

  override public function update(delta : Int) : Void {
    for (e in entities) {
      var velocity : Velocity = Velocity.ret.get(e);
      var keyControl : KeyboardControlled = KeyboardControlled.ret.get(e);
      if (keys[keyControl.up]) {
        velocity.y -= keyControl.power;
      }
      if (keys[keyControl.down]) {
        velocity.y += keyControl.power;
      }
      if (keys[keyControl.left]) {
        velocity.x -= keyControl.power;
      }
      if (keys[keyControl.right]) {
        velocity.x += keyControl.power;
      }
    }
  }
}