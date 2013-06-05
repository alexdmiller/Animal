package view;

import flash.display.Sprite;

import animal.core.Entity;

class BulletView extends Sprite {
  private var entity : Entity;

  public function new(e : Entity) {
    super();
    this.entity = e;

    this.graphics.beginFill(0xFF0000);
    this.graphics.drawRect(0, 0, 10, 10);
    e.on('position_changed', onPositionChanged);
  }

  private function onPositionChanged(event : Dynamic) : Void {
    this.x = event.position.x;
    this.y = event.position.y;
  }
}