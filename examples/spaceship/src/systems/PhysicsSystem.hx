package systems;

import animal.core.System;

class PhysicsSystem extends System {
  public function new() {
    super(['components.Position']);
  }

  override public function update(delta : Int) : Void {
    for (e in entities) {
      var position = cast(e.getComponentWithName('components.Position'), components.Position);
      trace(position.x);
    }
  }
}