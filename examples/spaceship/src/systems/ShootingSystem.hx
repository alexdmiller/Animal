package systems;

import flash.display.DisplayObject;
import flash.events.MouseEvent;

import animal.core.System;
import animal.core.Entity;
import animal.serialization.ComponentSerialize;

import components.Shooter;
import components.Position;
import components.Bullet;

class ShootingSystem extends System {
  public function new(stage : DisplayObject) {
    super(['components.Shooter', 'components.Position']);
    stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
  }

  private function onMouseDown(event : MouseEvent) : Void {
    for (e in entities) {
      var position : Position = Position.ret.get(e);
      var dx : Float = event.stageX - position.x;
      var dy : Float = event.stageY - position.y;
      var angle : Float = Math.atan2(dy, dx);
      var fx : Float = Math.cos(angle) * 8;
      var fy : Float = Math.sin(angle) * 8;
      var bullet = board.createEntity([
        ComponentSerialize.decodeJSON({
          type: 'components.Bullet'
        }),
        ComponentSerialize.decodeJSON({
          type: 'components.View',
          data: { type: 'bullet' }
        }),
        ComponentSerialize.decodeJSON({
          type: 'components.Position',
          data: { x: position.x, y: position.y }
        }),
        ComponentSerialize.decodeJSON({
          type: 'components.Velocity',
          data: { x: fx, y: fy }
        })
      ]);  
    }
  }
}