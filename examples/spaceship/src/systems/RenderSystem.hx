package systems;

import flash.display.Sprite;

import animal.core.System;
import animal.core.Entity;
import animal.core.Entity.ComponentRetriever;

import components.View;
import components.Position;

class RenderSystem extends System {
  public var canvas(default, null) : Sprite;

  public function new() {
    super(['components.View']);
    canvas = new Sprite();
  }

  override public function update(delta : Int) : Void {
    canvas.graphics.clear();
    canvas.graphics.beginFill(0x000000);
    for (e in entities) {
      var view : View = View.ret.get(e);
      var position : Position = Position.ret.get(e);
      switch (view.type) {
        case "circle":
        canvas.graphics.drawCircle(position.x, position.y, 20);
        break;
        case "none":
        break;
      }
      
    }
  }
}