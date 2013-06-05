package systems;

import flash.display.DisplayObject;
import flash.events.MouseEvent;

import animal.core.System;
import animal.core.Entity;
import animal.serialization.ComponentType;

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
      var bullet = board.createEntity([
        ComponentType.decodeJSON({
          type: 'components.Bullet'
        }),
        ComponentType.decodeJSON({
          type: 'components.View',
          data: { type: 'bullet' }
        }),
        ComponentType.decodeJSON({
          type: 'components.Position',
          data: { x: position.x, y: position.y }
        }),
        ComponentType.decodeJSON({
          type: 'components.Velocity',
          data: { x: 2, y: 2 }
        })
      ]);  
    }
  }
}