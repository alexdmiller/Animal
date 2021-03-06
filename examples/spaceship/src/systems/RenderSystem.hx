package systems;

import flash.display.Sprite;

import animal.core.System;
import animal.core.Entity;

import components.View;
import components.Position;
import view.SpaceshipView;
import view.BulletView;

class RenderSystem extends System {
  public var canvas(default, null) : Sprite;
  private var views : Hash<Sprite>;

  public function new() {
    super(['components.View']);
    canvas = new Sprite();
    views = new Hash<Sprite>();
  }

  private function addView(e : Entity) : Void {
    var viewDef : View = View.ret.get(e);
    var sprite : Sprite = null;
    switch (viewDef.type) {
      case "ship":
        sprite = new SpaceshipView(e);
      case "bullet":
        sprite = new BulletView(e);
      case "none":
    }
    if (sprite != null) {
      canvas.addChild(sprite);
      views.set(e.id, sprite);
    }
  }

  override public function added(e : Entity) : Void {
    addView(e);
  }

  override public function removed(e : Entity) : Void {
    // TODO
  }
}