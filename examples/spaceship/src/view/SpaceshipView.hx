package view;

import flash.display.Sprite;

import animal.core.Entity;

class SpaceshipView extends Sprite {
  private var entity : Entity;

  public function new(e : Entity) {
    super();
    this.entity = e;

    this.graphics.beginFill(0x000000);
    this.graphics.drawRect(0, 0, 20, 20);
    e.on('position_changed', onPositionChanged);
  }

  private function onPositionChanged(event : Dynamic) : Void {
    this.x = event.position.x;
    this.y = event.position.y;
  }
}